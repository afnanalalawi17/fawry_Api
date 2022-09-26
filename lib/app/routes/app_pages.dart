import 'package:get/get.dart';

import '../modules/Activitys/bindings/activitys_binding.dart';
import '../modules/Activitys/views/activitys_view.dart';
import '../modules/Add_Activity/bindings/add_activity_binding.dart';
import '../modules/Add_Activity/views/add_activity_view.dart';
import '../modules/Add_Services/bindings/add_services_binding.dart';
import '../modules/Add_Services/views/add_services_view.dart';
import '../modules/Add_item/bindings/add_item_binding.dart';
import '../modules/Add_item/views/add_item_view.dart';
import '../modules/Ads_app/bindings/ads_app_binding.dart';
import '../modules/Ads_app/views/ads_app_view.dart';
import '../modules/Basic/bindings/basic_binding.dart';
import '../modules/Basic/views/basic_view.dart';
import '../modules/Boarding/bindings/boarding_binding.dart';
import '../modules/Boarding/views/boarding_view.dart';
import '../modules/Change_password/bindings/change_password_binding.dart';
import '../modules/Change_password/views/change_password_view.dart';
import '../modules/Delete_Company/bindings/delete_company_binding.dart';
import '../modules/Delete_Company/views/delete_company_view.dart';
import '../modules/Detials_Report/bindings/detials_report_binding.dart';
import '../modules/Detials_Report/views/detials_report_view.dart';
import '../modules/Detials_Stock/bindings/detials_stock_binding.dart';
import '../modules/Detials_Stock/views/detials_stock_view.dart';
import '../modules/Detials_Stock_Product/bindings/detials_stock_product_binding.dart';
import '../modules/Detials_Stock_Product/views/detials_stock_product_view.dart';
import '../modules/Detials_Stock_comprehensive/bindings/detials_stock_comprehensive_binding.dart';
import '../modules/Detials_Stock_comprehensive/views/detials_stock_comprehensive_view.dart';
import '../modules/Edit_Activity/bindings/edit_activity_binding.dart';
import '../modules/Edit_Activity/views/edit_activity_view.dart';
import '../modules/Edit_Services/bindings/edit_services_binding.dart';
import '../modules/Edit_Services/views/edit_services_view.dart';
import '../modules/Enter_Rest_Password/bindings/enter_rest_password_binding.dart';
import '../modules/Enter_Rest_Password/views/enter_rest_password_view.dart';
import '../modules/Favorite/bindings/favorite_binding.dart';
import '../modules/Favorite/views/favorite_view.dart';
import '../modules/History2/bindings/history2_binding.dart';
import '../modules/History2/views/history2_view.dart';
import '../modules/Items/bindings/items_binding.dart';
import '../modules/Items/views/items_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Print/bindings/print_binding.dart';
import '../modules/Print/views/print_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/Purchase_Invoice/bindings/purchase_invoice_binding.dart';
import '../modules/Purchase_Invoice/views/purchase_invoice_view.dart';
import '../modules/Purchase_Invoice_History/bindings/purchase_invoice_history_binding.dart';
import '../modules/Purchase_Invoice_History/views/purchase_invoice_history_view.dart';
import '../modules/Report/bindings/report_binding.dart';
import '../modules/Report/views/report_view.dart';
import '../modules/Rest_password/bindings/rest_password_binding.dart';
import '../modules/Rest_password/views/rest_password_view.dart';
import '../modules/Sales_Invoice_History/bindings/sales_invoice_history_binding.dart';
import '../modules/Sales_Invoice_History/views/sales_invoice_history_view.dart';
import '../modules/Sales_Invoices/bindings/sales_invoices_binding.dart';
import '../modules/Sales_Invoices/views/sales_invoices_view.dart';
import '../modules/Select_Company_purchase/bindings/select_company_purchase_binding.dart';
import '../modules/Select_Company_purchase/views/select_company_purchase_view.dart';
import '../modules/Select_Company_sales/bindings/select_company_sales_binding.dart';
import '../modules/Select_Company_sales/views/select_company_sales_view.dart';
import '../modules/Select_lang/bindings/select_lang_binding.dart';
import '../modules/Select_lang/views/select_lang_view.dart';
import '../modules/Services/bindings/services_binding.dart';
import '../modules/Services/views/services_view.dart';
import '../modules/Setting/bindings/show_devices_binding.dart';
import '../modules/Setting/views/show_devices_view.dart';
import '../modules/Signup/bindings/signup_binding.dart';
import '../modules/Signup/views/signup_view.dart';
import '../modules/archives/bindings/archives_binding.dart';
import '../modules/archives/views/archives_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/invoice/bindings/invoice_binding.dart';
import '../modules/invoice/views/invoice_view.dart';
import '../modules/multi_history/bindings/multi_history_binding.dart';
import '../modules/multi_history/views/multi_history_view.dart';
import '../modules/phone/bindings/phone_binding.dart';
import '../modules/phone/views/phone_view.dart';
import '../modules/showInvoices/bindings/show_invoices_binding.dart';
import '../modules/showInvoices/views/show_invoices_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.BOARDING,
      page: () => BoardingView(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITYS,
      page: () => ActivitysView(),
      binding: ActivitysBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ACTIVITY,
      page: () => AddActivityView(),
      binding: AddActivityBinding(),
    ),
    GetPage(
      name: _Paths.REST_PASSWORD,
      page: () => RestPasswordView(),
      binding: RestPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () => ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SERVICES,
      page: () => AddServicesView(),
      binding: AddServicesBinding(),
    ),
    GetPage(
      name: _Paths.PRINT,
      page: () => PrintView(),
      binding: PrintBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_REST_PASSWORD,
      page: () => EnterRestPasswordView(),
      binding: EnterRestPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.BASIC,
      page: () => BasicView(),
      binding: BasicBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SERVICES,
      page: () => EditServicesView(),
      binding: EditServicesBinding(),
    ),
    GetPage(
      name: _Paths.PHONE,
      page: () => PhoneView(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_INVOICES,
      page: () => ShowInvoicesView(),
      binding: ShowInvoicesBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_DEVICES,
      page: () => ShowDevicesView(),
      binding: ShowDevicesBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.DETIALS_REPORT,
      page: () => DetialsReportView(),
      binding: DetialsReportBinding(),
    ),
    GetPage(
      name: _Paths.MULTI_HISTORY,
      page: () => MultiHistoryView(),
      binding: MultiHistoryBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY2,
      page: () => History2View(),
      binding: History2Binding(),
    ),
    GetPage(
      name: _Paths.SELECT_LANG,
      page: () => SelectLangView(),
      binding: SelectLangBinding(),
    ),
    GetPage(
      name: _Paths.DETIALS_STOCK,
      page: () => const DetialsStockView(),
      binding: DetialsStockBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_INVOICE,
      page: () => const PurchaseInvoiceView(),
      binding: PurchaseInvoiceBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_INVOICE_HISTORY,
      page: () => PurchaseInvoiceHistoryView(),
      binding: PurchaseInvoiceHistoryBinding(),
    ),
    GetPage(
      name: _Paths.SALES_INVOICES,
      page: () => const SalesInvoicesView(),
      binding: SalesInvoicesBinding(),
    ),
    GetPage(
      name: _Paths.DETIALS_STOCK_PRODUCT,
      page: () => DetialsStockProductView(),
      binding: DetialsStockProductBinding(),
    ),
    GetPage(
      name: _Paths.DETIALS_STOCK_COMPREHENSIVE,
      page: () => DetialsStockComprehensiveView(),
      binding: DetialsStockComprehensiveBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ITEM,
      page: () => AddItemView(),
      binding: AddItemBinding(),
    ),
    GetPage(
      name: _Paths.ITEMS,
      page: () => ItemsView(),
      binding: ItemsBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVES,
      page: () => const ArchivesView(),
      binding: ArchivesBinding(),
    ),
    GetPage(
      name: _Paths.SALES_INVOICE_HISTORY,
      page: () => SalesInvoiceHistoryView(),
      binding: SalesInvoiceHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_COMPANY,
      page: () => DeleteCompanyView(),
      binding: DeleteCompanyBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_COMPANY_PURCHASE,
      page: () => SelectCompanyPurchaseView(),
      binding: SelectCompanyPurchaseBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_COMPANY_SALES,
      page: () => SelectCompanySalesView(),
      binding: SelectCompanySalesBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADS_APP,
      page: () => AdsAppView(),
      binding: AdsAppBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACTIVITY,
      page: () =>  EditActivityView(),
      binding: EditActivityBinding(),
    ),
  ];
}
