part of "list_data_imports.dart";

class ListDataController extends BaseController {
  ListDataController();
  final Client client = Client();
  late Databases database;
  BaseBloc<List<ListDataModel>> listBloc = BaseBloc();
  @override
  void dispose() {}

  @override
  void setBuildContext(BuildContext widgetContext) {
    context = widgetContext;
  }

  initClient(){
    client.setEndpoint(ApplicationConstants.BASE_ENDPOINT).setProject(ApplicationConstants.PROJECT_ID);
    database = Databases(client);
  }

  fetchData() async {
    listBloc.loadingState();
    try {
      var response = await database.listDocuments(
        collectionId: ApplicationConstants.COLLECTION_ID,
        databaseId: ApplicationConstants.DATABASE_ID,
      );
      print('Documents: ${response.documents.map((e) => e.data)}');
      listBloc.successState(response.documents.map((doc) => ListDataModel.fromJson(doc.data)).toList());
    } catch (e) {
      listBloc.failedState(BadRequestError(message: e.toString()), () => fetchData);
      print(e);
    }
  }

}