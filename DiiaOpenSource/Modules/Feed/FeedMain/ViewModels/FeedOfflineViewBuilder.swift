import UIKit
import DiiaUIComponents
import DiiaCommonTypes

class FeedOfflineModeConstructor {
    static func buildOfflineModel() -> DSConstructorModel {
        let firstName = MockDocumentsData.getResolvedFirstName()
        let welcomeTitle = "Привіт, \(firstName) 👋"
        
        let json = """
        {
          "topGroup": [
            {
              "topGroupOrg": {
                "titleGroupMlc": {
                  "heroText": "\(welcomeTitle)"
                }
              }
            }
          ],
          "body": [
            {
              "whiteCardMlc": {
                "action": {
                  "type": "invincibilityPoints"
                },
                "doubleIconAtm": {
                  "code": "safetyLarge"
                },
                "title": "Незламність",
                "label": "Мапа Пунктів Незламності та укриттів.\\nЗаява про відсутній звʼязок.",
                "accessibilityDescription": "Незламність\\nМапа Пунктів Незламності та укриттів.\\nЗаява про відсутній звʼязок.",
                "smallIconAtm": {
                  "code": "ellipseArrowRight"
                }
              }
            },
            {
              "btnIconRoundedGroupOrg": {
                "items": [
                  {
                    "btnIconRoundedMlc": {
                      "label": "Сканувати QR-код",
                      "icon": "qrScanWhite",
                      "action": {
                        "type": "qr"
                      }
                    }
                  },
                  {
                    "btnIconRoundedMlc": {
                      "label": "Військові облігації",
                      "icon": "tridentWhite",
                      "action": {
                        "type": "militaryBonds"
                      }
                    }
                  },
                  {
                    "btnIconRoundedMlc": {
                      "label": "Відсутній звʼязок",
                      "icon": "failedConnection",
                      "action": {
                        "type": "failedConnection"
                      }
                    }
                  }
                ]
              }
            },
            {
              "imageCardMlc": {
                "iconRight": "ellipseWhiteArrowRight",
                "label": "Змінити хід подій",
                "imageAltText": "Ініціатива президента лінія дронів",
                "image": "https://api2.diia.gov.ua/ZzTj5gLXnaW8u0s0/smart-mobilization/drones-line.png",
                "action": {
                  "type": "smartMobilization"
                }
              }
            },
            {
              "sectionTitleAtm": {
                "label": "Що нового?"
              }
            },
            {
              "halvedCardCarouselOrg": {
                "items": [
                  {
                    "halvedCardMlc": {
                      "accessibilityDescription": "15 грудня, 12:30\\nОберіть фіналіста Нацвідбору на Євробачення-2024 в Дії",
                      "label": "15 грудня, 12:30",
                      "title": "Оберіть фіналіста Нацвідбору на Євробачення-2024 в Дії",
                      "image": "https://api2t.diia.gov.ua/img/diia-news/uploads/public/657/c29/7a7/657c297a776a1886429868.png",
                      "action": {
                        "type": "news",
                        "resource": "20"
                      }
                    }
                  },
                  {
                    "halvedCardMlc": {
                      "accessibilityDescription": "14 грудня, 15:21\\nРозширюємо програму єВідновлення: подати заяву про допомогу",
                      "label": "14 грудня, 15:21",
                      "title": "Розширюємо програму єВідновлення: подати заяву про допомогу",
                      "image": "https://api2t.diia.gov.ua/img/diia-news/uploads/public/657/b00/951/657b00951a939914149240.jpg",
                      "action": {
                        "type": "news",
                        "resource": "19"
                      }
                    }
                  },
                  {
                    "iconCardMlc": {
                      "label": "Всі новини",
                      "iconLeft": "stack",
                      "action": {
                        "type": "allNews"
                      }
                    }
                  }
                ],
                "dotNavigationAtm": {
                  "count": 3
                }
              }
            },
            {
              "sectionTitleAtm": {
                "label": "Популярні послуги"
              }
            },
            {
              "listItemGroupOrg": {
                "items": [
                  {
                    "label": "Опитування",
                    "action": {
                      "type": "polls"
                    },
                    "iconRight": {
                      "code": "ellipseArrowRight"
                    }
                  },
                  {
                    "label": "Податки ФОП",
                    "action": {
                      "type": "privateEntrepreneur"
                    },
                    "iconRight": {
                      "code": "ellipseArrowRight"
                    }
                  },
                  {
                    "label": "Заміна водійського посвідчення",
                    "action": {
                      "type": "replacementDriverLicense"
                    },
                    "iconRight": {
                      "code": "ellipseArrowRight"
                    }
                  },
                  {
                    "label": "Реєстрація пошкодженого майна",
                    "action": {
                      "type": "damagedProperty"
                    },
                    "iconRight": {
                      "code": "ellipseArrowRight"
                    }
                  }
                ]
              }
            }
          ]
        }
        """

        if let model: DSConstructorModel = json.parseDecodable() {
            return model
        }

        let buttonGroup = DSButtonIconRoundedGroupModel(
            items: [
                .init(btnIconRoundedMlc: .init(
                    label: R.Strings.feed_qr_title.localized(),
                    icon: Constants.qrIcon,
                    action: DSActionParameter(type: Constants.qrAction))),
                .init(btnIconRoundedMlc: .init(
                    label: "Військові облігації",
                    icon: Constants.tridentIcon,
                    action: DSActionParameter(type: Constants.militaryBondsAction))),
                .init(btnIconRoundedMlc: .init(
                    label: "Відсутній звʼязок",
                    icon: Constants.failedConnectionIcon,
                    action: DSActionParameter(type: Constants.failedConnectionAction)))
            ])
        
        return DSConstructorModel(
            topGroup: [
                AnyCodable.dictionary([Constants.topGroupKey:
                                        AnyCodable.fromEncodable(encodable: DSTopGroupOrg(titleGroupMlc: .init(heroText: welcomeTitle)))])
            ],
            body: [
                AnyCodable.dictionary([Constants.btnGroupKey: AnyCodable.fromEncodable(encodable: buttonGroup)])
            ],
            bottomGroup: nil,
            ratingForm: nil
        )
    }
}

// MARK: - Constants
extension FeedOfflineModeConstructor {
    private enum Constants {
        static let whiteCardSmallIcon = "ellipseArrowRight"
        static let whiteCardDoubleIcon = "safetyLarge"
        
        static let qrIcon = "qrScanWhite"
        static let tridentIcon = "tridentWhite"
        static let targetIcon = "targetWhite"
        static let failedConnectionIcon = "failedConnection"

        static let blackCardAction = "invincibilityPoints"
        static let qrAction = "qr"
        static let dronesAction = "militaryDonation"
        static let failedConnectionAction = "failedConnection"
        static let militaryBondsAction = "militaryBonds"
        static let enemyTrackAction = "enemyTrack"
        static let topGroupKey = "topGroupOrg"
        static let btnGroupKey = "btnIconRoundedGroupOrg"
    }
}
