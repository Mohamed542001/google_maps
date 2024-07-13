import '../../../../core/src/app_export.dart';
import '../../cubit/feature_cubit.dart';

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<FeatureBloc, FeatureState>(
            builder: (context, state) {
              if (state is FeatureLoading) {
                return const CircularProgressIndicator.adaptive();
              }
              else if (state is FeatureSuccess) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name:'),
                        const Gap(5),
                        Text(FeatureBloc.get(context).user!.name),
                      ],
                    ),
                    const SizedBox.square(dimension: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('User name:'),
                        const Gap(5),
                        Text(FeatureBloc.get(context).user!.username),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Email:'),
                        const Gap(5),
                        Text(FeatureBloc.get(context).user!.email),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Phone:'),
                        const Gap(5),
                        Text(FeatureBloc.get(context).user!.phone),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Website:'),
                        const Gap(5),
                        Text(FeatureBloc.get(context).user!.website),
                      ],
                    ),
                  ],
                );
              } else if (state is FeatureError) {
                return Center(
                  child: Text(
                    NetworkExceptions.getErrorMessage(state.networkExceptions),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const Gap(50),
          Center(
            child: ElevatedButton(
              onPressed: () => FeatureBloc.get(context).getUser(1),
              child: const Text('Get user'),
            ),
          ),
        ],
      ),
    );
  }
}
