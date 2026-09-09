import Foundation
import DiiaCommonTypes
import DiiaUIComponents

public struct MockPublicServicesData {
    public static var mockResponse: PublicServiceResponse {
        PublicServiceResponse(
            publicServicesCategories: [
                PublicServiceCategory(
                    code: "residence",
                    icon: "house",
                    name: "Місце проживання",
                    status: .active,
                    visibleSearch: true,
                    requiresPrestartWarning: false,
                    tabCodes: [.citizen],
                    publicServices: [
                        PublicServiceModel(status: .active, name: "Витяг про місце проживання", code: "residence_extract", badgeNumber: nil, search: "витяг місце проживання прописка", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Зміна місця проживання", code: "residence_change", badgeNumber: nil, search: "зміна місця проживання", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Довідка ВПО", code: "idp_certificate", badgeNumber: nil, search: "довідка впо переселенець", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Скасування статусу ВПО", code: "idp_cancel", badgeNumber: nil, search: "скасування впо", contextMenu: nil)
                    ],
                    chips: nil
                ),
                PublicServiceCategory(
                    code: "extracts",
                    icon: "document",
                    name: "Довідки та витяги",
                    status: .active,
                    visibleSearch: true,
                    requiresPrestartWarning: false,
                    tabCodes: [.citizen],
                    publicServices: [
                        PublicServiceModel(status: .active, name: "Витяг про несудимість", code: "criminal_record", badgeNumber: nil, search: "несудимість витяг довідка", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Довідка про доходи", code: "income_certificate", badgeNumber: nil, search: "доходи довідка", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Витяг з ЄДР", code: "edr_extract", badgeNumber: nil, search: "витяг з єдр", contextMenu: nil)
                    ],
                    chips: nil
                ),
                PublicServiceCategory(
                    code: "taxes",
                    icon: "taxes",
                    name: "Податки",
                    status: .active,
                    visibleSearch: true,
                    requiresPrestartWarning: false,
                    tabCodes: [.citizen, .office],
                    publicServices: [
                        PublicServiceModel(status: .active, name: "Податки ФОП", code: "fop_taxes", badgeNumber: nil, search: "податки фоп єсв єдиний", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Декларація платника єдиного податку", code: "tax_declaration", badgeNumber: nil, search: "декларація звіт фоп", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Стан розрахунків з бюджетом", code: "budget_status", badgeNumber: nil, search: "стан розрахунків борг переплата", contextMenu: nil)
                    ],
                    chips: nil
                ),
                PublicServiceCategory(
                    code: "business",
                    icon: "briefcase",
                    name: "Бізнес",
                    status: .active,
                    visibleSearch: true,
                    requiresPrestartWarning: false,
                    tabCodes: [.office],
                    publicServices: [
                        PublicServiceModel(status: .active, name: "Автоматична реєстрація ФОП", code: "fop_registration", badgeNumber: nil, search: "відкрити фоп бізнес", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Внесення змін про ФОП", code: "fop_changes", badgeNumber: nil, search: "змінити кведи контакти", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Закриття ФОП", code: "fop_close", badgeNumber: nil, search: "закрити припинити фоп", contextMenu: nil)
                    ],
                    chips: nil
                ),
                PublicServiceCategory(
                    code: "pensioners",
                    icon: "pension",
                    name: "Пенсіонерам",
                    status: .active,
                    visibleSearch: true,
                    requiresPrestartWarning: false,
                    tabCodes: [.citizen],
                    publicServices: [
                        PublicServiceModel(status: .active, name: "Призначення пенсії", code: "pension_apply", badgeNumber: nil, search: "пенсія призначення оформити", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Перерахунок пенсії", code: "pension_recalculate", badgeNumber: nil, search: "перерахунок пенсії", contextMenu: nil),
                        PublicServiceModel(status: .active, name: "Пенсійне посвідчення", code: "pension_card", badgeNumber: nil, search: "пенсійне посвідчення документ", contextMenu: nil)
                    ],
                    chips: nil
                )
            ],
            tabs: [
                PublicServiceTab(name: "Громадянам", code: .citizen),
                PublicServiceTab(name: "Бізнесу", code: .office)
            ],
            additionalElements: nil
        )
    }
}
