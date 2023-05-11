import 'package:bloc_test/bloc_test.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';
import 'package:test/test.dart';
import 'package:test_assignment/internal/dependencies/repository_module.dart'
    as rep_module;

void main() {
  group(
    'ListWeatherBloc test',
    () {
      late ListWeatherBloc listWeatherBloc;

      setUp(() {
        listWeatherBloc = ListWeatherBloc(rep_module.weatherRepository);
      });

      tearDown(
        () => listWeatherBloc.close(),
      );

      group('Initial state', () {
        test('initial state is correct', () {
          expect(
              listWeatherBloc.state,
              ListWeatherInitialState(
                  weathers: const [], status: ListWeatherStatus.initial));
        });

        test('initialised state is correct', () {
          listWeatherBloc.add(ListWeatherInitialised());
          expect(
              listWeatherBloc.state,
              ListWeatherInitialState(
                  weathers: const [], status: ListWeatherStatus.initial));
        });
      });

      group('Test on error request', () {
        test(
            'We send ListWeatherEndedWithSuccess with non-existen city and our state.status.isError == true',
            () async {
          listWeatherBloc.add(ListWeatherEndedWithSuccess('GGGGG'));
          await Future.delayed(const Duration(seconds: 1));
          expect(listWeatherBloc.state.status.isError, true);
        });
      });

      group(
        'Loading test',
        () {
          blocTest<ListWeatherBloc, ListWeatherState>(
            'emits [MyState] when MyEvent is added.',
            build: () => listWeatherBloc,
            act: (bloc) => bloc.add(ListWeatherEndedWithSuccess('London')),
            expect: () => <ListWeatherState>[
              ListWeatherState(
                status: ListWeatherStatus.loading,
                weathers: const [],
              )
            ],
          );
        },
      );

      group(
        'Test on success success request',
        () {
          test(
              'We send ListWeatherEndedWithSuccess with existen city and our state.status.isSuccess == true',
              () async {
            listWeatherBloc.add(ListWeatherEndedWithSuccess('London'));
            await Future.delayed(const Duration(seconds: 1));
            expect(listWeatherBloc.state.status.isSuccess, true);
          });

          test(
              'We send ListWeatherEndedWithSuccess with existen city and after that we send ListWeatherInitialised and our state.status.intial == true',
              () async {
            listWeatherBloc.add(ListWeatherEndedWithSuccess('London'));
            await Future.delayed(const Duration(seconds: 1));
            listWeatherBloc.add(ListWeatherInitialised());
            await Future.delayed(const Duration(seconds: 1));
            print('state status is ${listWeatherBloc.state.status}');
            expect(listWeatherBloc.state.status.isInitial, true);
          });
        },
      );

      group(
        'Test on change sorting type',
        () {
          test('initial isSorted == true ', () async {
            listWeatherBloc.add(ListWeatherEndedWithSuccess('London'));
            await Future.delayed(const Duration(seconds: 1));
            expect(listWeatherBloc.state.isSorted, true);
          });

          test(
              'We send ListWeatherChangedSortingType and our state.isSorted == false',
              () async {
            listWeatherBloc.add(ListWeatherEndedWithSuccess('London'));
            print('state isSorted is ${listWeatherBloc.state.isSorted}');
            await Future.delayed(const Duration(seconds: 1));

            listWeatherBloc.add(ListWeatherChangedSortingType());
            print('state isSorted is ${listWeatherBloc.state.isSorted}');

            await Future.delayed(const Duration(seconds: 1));
            print('state isSorted is ${listWeatherBloc.state.isSorted}');

            expect(listWeatherBloc.state.isSorted, false);
          });
        },
      );
    },
  );
}
