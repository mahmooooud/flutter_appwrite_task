part of "list_data_imports.dart";

class ListDataScreen extends StatefulWidget {
  const ListDataScreen({super.key});

  @override
  State<ListDataScreen> createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  late ListDataController controller;

  @override
  void initState() {
    controller = ListDataController();
    controller.setBuildContext(context);
    controller.initClient();
    super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.background,
        title: CustomText(
          "Flutter Appwrite Task",
          textStyle: context.textTheme.titleMedium!,
        ),
      ),
      backgroundColor: context.colors.background,
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<BaseBloc<List<ListDataModel>>, BaseState<List<ListDataModel>>>(
                bloc: controller.listBloc,
                builder: (context,state){
                  return state.maybeWhen(
                    success: (model){
                      return ListView.separated(
                        itemCount: model?.length ?? 0,
                        separatorBuilder: (context,index) => Gaps.vGap10,
                        itemBuilder: (context, index) {
                          final item = model?[index];
                          return DataCell(
                            title: item?.title ?? "",
                            description: item?.description ?? ""
                          );
                        },
                      );
                    },
                    orElse: () => const SizedBox(),
                    loading: () => Center(
                      child: CupertinoActivityIndicator(
                        color: context.colors.primary,
                        radius: 20,
                      ),
                    ),
                    failure: (error, func) => Center(
                      child: PageErrorView(
                        actionName: "Try Again",
                        errorMessage: error.toString(),
                      ),
                    ),
                  );
                },

              ),
            ),
            Center(
              child: AppTextButton(
                onPressed: controller.fetchData,
                text: "Load Data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
        