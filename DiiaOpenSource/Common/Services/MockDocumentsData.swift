import Foundation
import DiiaCommonTypes
import DiiaDocumentsCommonTypes

public struct MockDocumentsData {
    // MARK: - User Configuration
    public static var USER_FULL_NAME = "ЛЕГЕНДА БЕСТ КОДЕР"
    public static var USER_FIRST_NAME = ""
    public static var USER_BIRTHDAY = "12.05.2008"
    public static var USER_RNOKPP = "4027309835"

    public static func getResolvedFirstName() -> String {
        if !USER_FIRST_NAME.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return USER_FIRST_NAME.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        let parts = USER_FULL_NAME.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        if parts.count >= 2 {
            let name = parts[1].lowercased()
            return name.prefix(1).uppercased() + name.dropFirst()
        } else if let first = parts.first {
            let name = first.lowercased()
            return name.prefix(1).uppercased() + name.dropFirst()
        }
        return "Легенда"
    }

    public static var UPDATE_TIME_HOURS_DELAY: TimeInterval = 2 * 3600

    public static func getUpdatedTimeFormatted(delay: TimeInterval = UPDATE_TIME_HOURS_DELAY) -> String {
        let date = Date().addingTimeInterval(-delay)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "uk_UA")
        formatter.dateFormat = "HH:mm | dd.MM.yyyy"
        return formatter.string(from: date)
    }

    public static let SIGNATURE_BASE64 = "iVBORw0KGgoAAAANSUhEUgAAANIAAAByCAYAAAAmhY+sAAAP7klEQVR4nO2dC5BXUxzHfxshz5QNhaIthVApIq9CZIyYEoYtoVhUKtKDSpoiU2pHajXTQ6klPaSUJskkTJImMvIIqdD2kiJF5ntn/jv/du8593Ue9979fWZ2tu79/+85+//f7z3n/M7vkXPo0KFDxDBMJCpFezvDMCwkhlEEj0gMowAWEsMogIXEMApgITGMAlhIDKMAFhLDKICFxDAKYCHFkAULFlCDBg2oZcuW1LhxY+rdu7ftLjEe5LCLUHyAeH799VfXc2effTatWbPGeJ8Yf/CIFANat25NVatWFYoIbNy4kXbv3m20X4x/eESyDATklypVqtDWrVu19ocJB49ICRER+Ouvv7T1hYkGCykhImLizZG2Gq5fvz79/vvv5Y4fffTR1LRpU7rwwgtpxIgRlEbefvtt211gkrhG6tixIy1evDjUe7t160bPP/88pQV8Dvg8wrJlyxY69thjlfaJifHUrnPnzs70BT9hRQQmTJhAAwcOpLTgJSLsHcmQWfaYlAjpnXfeKRXP3LlzlV133LhxlAaee+456fldu3bReeedJ31NkyZNFPeKiZWQIJ577rmHdPDff//R2LFjKcl8++239OKLLwrPFxYWOr/z8vIM9oqJjZAyI5BuPvzwQ0oyzZs3l56/9957nd+1a9c21CNGxMiRI+nmm2+mNm3aULt27UirkAYPHmzUhAsXmaSycOFCktl0MKXLMGnSJEO9Ytzo2rUrDRs2jNauXUufffYZ7dmzh5566inSYv6+66676N133w38viOOOIJq1KhBZ511Fl111VU0YMAAevjhh+m3335zOrxq1Srhe91M5Unh7rvvFp677777nI3W008/3de1OnTooLBnTFneeOMN5/eff/7p/F69ejUtXbqUlAtp9OjRgUR0xx13UFFRkfD8K6+8UvrvatWqOeshN/755x9KIjDAyMAIFGQUevXVVxX0ihH5PIadCQUSEixxQ4YM8XzdTTfdRDNmzKCgyKY/UfZeggLR4sm/fPlyX6/Pz8+n/v3706mnnko5OTmHnVNpgOnVq5eyazHlwehTFr8e94E2ZL3WRNlz/TDIrh/12n655ppr6IsvvqC40alTJxozZoztbqSWvLw8KikpCX3f+R6RZNM57H2sXLmSkk5c/d9MPUQqMiUuIurZs6fv9/u22k2bNk14TreIdE9ptm3bFjsRwRcR1iIWkX6wNhdZpv3ie2p32mmn0d9//+16TsWX3ahRI9q0aZO268ueRHHaBMUatEePHra7UWH4999/qXr16uWO16pVi7766ivf1/E9tROJSBUiEel20IyDiJo1a0ZTpkyhmjVr2u5KhePKK690PR5ERIGmdieeeKLw3O23305R+Oabb6SJQHTx0EMPkU3g2Y7RdsmSJSwiS6xfv17JdXxP7bBxOGfOnHLHETvkZ8Mqbta6nTt3SvcIunTpQqNGjToshgh/5/HHH+9sA2zevDl027NmzaLrrrsu9PsZNVx00UX0008/KbnnfAsJO7348uHGn2no0ksvdQR25513kg4h4brjx48nHfTt29cJ0XAjyAe5aNEiJ4/Czz//TPv27XO8FKZOnSp9DxsQ4oHovtMqpAwNGzZ0frZv304FBQWRN0pt7R3VqVNHeH2d+2FPPvmks3nL2AVOwvPnzy93HN8NviMjEbKtWrWi999/n1Qguulyc3Od0ANd6BSw7NoYvZANiEnPaBTa+1uViM4//3zhOXjfJhFM8WSwiOzzwgsvuB5/8MEHk5nXzqZLkK62RQtYwHnp0jkaWU3HJXNqRVbRpCISEbj11luN9oWRRxtkg/CeKFgbkWw7qMranzx5su/IyCDXhQkdcViMPRD35ZZoM+o9VyluMTofffQRxXUO7WdvSgaLyC7YutGVrdaKkGQxOjIDRNx3u0VBiUw8QJycG25m8ESnLL7llluMtVW5cmXl16xbt67yazLqEK29Rf52sRaSbA3x2muvGesH9sJMcsMNNxhtjzmcBx54gIIYHxI7IqHIlkmQY9wkJ510ktH2mPL+jaJEPokT0jnnnCM898knn5jsipOk3ySI52Ls0L17d9fjXlltY2v+tm3yDtIfnPvxxx+VXY8dVe0h+l7gggZXtESNSMOHDxee27BhA8WNoDc+cvMxySqho0pERkekOD6tVWZFQpDgzJkzlVyLUccFF1xAv/zyi+t+pcqtltgYG2zQokULZdeSiYixA1IOu4lIx36ldSEhfbEtTBkcEEXMmEeUs7u4uFh5W0amdueee65wDWF7yqNqyim7DlyDuNxlOry8rY5ItsViG1niGEYPohzpKg0MxoW0f/9+qsiccMIJtrtQ4XjiiSdc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"

    public static let PHOTO_BASE64 = "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"

    // MARK: - Mock Documents JSON Builder
    public static var mockFullDocumentModel: DSFullDocumentModel? {
        let jsonString = """
        {
          "status": 200,
          "expirationDate": "2050-03-09T00:00:00Z",
          "data": [
            {
              "id": "mock-edoc-1",
              "docNumber": "0000000000",
              "order": 1,
              "expirationDate": "09.03.2050",
              "localization": "ua",
              "shareLocalization": "ua",
              "docStatus": 200,
              "docData": {
                "docName": "єДокумент",
                "birthday": "\(USER_BIRTHDAY)",
                "category": "",
                "fullName": "\(USER_FULL_NAME)"
              },
              "content": [
                {
                  "code": "photo",
                  "image": "\(PHOTO_BASE64)"
                }
              ],
              "dataForDisplayingInOrderConfigurations": {
                "id": "mock-edoc-1",
                "label": "єДокумент",
                "description": "єДокумент"
              },
              "frontCard": {
                "ua": [
                  {
                    "docHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "єДокумент"
                      }
                    },
                    "tableBlockTwoColumnsPlaneOrg": {
                      "componentId": "mock-edoc-1_plane",
                      "photo": "\(PHOTO_BASE64)",
                      "items": [
                        {
                          "tableItemVerticalMlc": {
                            "label": "Дата народження:",
                            "value": "\(USER_BIRTHDAY)"
                          }
                        },
                        {
                          "tableItemVerticalMlc": {
                            "label": "РНОКПП:",
                            "value": "\(USER_RNOKPP)"
                          }
                        }
                      ]
                    },
                    "tickerAtm": {
                      "type": "positive",
                      "usage": "grand",
                      "value": "Документ діє у період воєнного стану • Документ є дійсним • "
                    },
                    "docButtonHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "\(USER_FULL_NAME.replacingOccurrences(of: " ", with: "\\n"))"
                      },
                      "iconAtm": {
                        "code": "ellipseKebab"
                      }
                    }
                  }
                ]
              },
              "fullInfo": [
                {
                  "docHeadingOrg": {
                    "docNumberCopyMlc": {
                      "label": "єДокумент",
                      "value": "0000000000"
                    },
                    "headingWithSubtitlesMlc": {
                      "value": "\(USER_FULL_NAME)",
                      "subtitles": ["\(USER_BIRTHDAY) р.н."]
                    }
                  },
                  "tableBlockTwoColumnsOrg": {
                    "componentId": "mock-edoc-1_full",
                    "photo": "\(PHOTO_BASE64)",
                    "items": [
                      {
                        "tableItemVerticalMlc": {
                          "label": "Прізвище, ім'я, по батькові",
                          "value": "\(USER_FULL_NAME)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Дата народження",
                          "value": "\(USER_BIRTHDAY)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "РНОКПП",
                          "value": "\(USER_RNOKPP)"
                        }
                      }
                    ]
                  }
                }
              ]
            },
            {
              "id": "mock-student-2",
              "docNumber": "КВ № 983214",
              "order": 2,
              "expirationDate": "30.06.2028",
              "localization": "ua",
              "shareLocalization": "ua",
              "docStatus": 200,
              "docData": {
                "docName": "Студентський квиток",
                "birthday": "\(USER_BIRTHDAY)",
                "category": "",
                "fullName": "\(USER_FULL_NAME)"
              },
              "content": [
                {
                  "code": "photo",
                  "image": "\(PHOTO_BASE64)"
                }
              ],
              "dataForDisplayingInOrderConfigurations": {
                "id": "mock-student-2",
                "label": "Студентський квиток",
                "description": "Студентський квиток"
              },
              "frontCard": {
                "ua": [
                  {
                    "docHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "Студентський квиток"
                      }
                    },
                    "tableBlockTwoColumnsPlaneOrg": {
                      "componentId": "mock-student-2_plane",
                      "photo": "\(PHOTO_BASE64)",
                      "items": [
                        {
                          "tableItemVerticalMlc": {
                            "label": "Форма навчання:",
                            "value": "Денна"
                          }
                        },
                        {
                          "tableItemVerticalMlc": {
                            "label": "Дійсний до:",
                            "value": "30.06.2028"
                          }
                        }
                      ]
                    },
                    "tickerAtm": {
                      "type": "positive",
                      "usage": "grand",
                      "value": "Студентський квиток дійсний • "
                    },
                    "docButtonHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "\(USER_FULL_NAME.replacingOccurrences(of: " ", with: "\\n"))"
                      },
                      "iconAtm": {
                        "code": "ellipseKebab"
                      }
                    }
                  }
                ]
              },
              "fullInfo": [
                {
                  "docHeadingOrg": {
                    "docNumberCopyMlc": {
                      "label": "Студентський квиток",
                      "value": "КВ № 983214"
                    },
                    "headingWithSubtitlesMlc": {
                      "value": "\(USER_FULL_NAME)",
                      "subtitles": ["\(USER_BIRTHDAY) р.н."]
                    }
                  },
                  "tableBlockTwoColumnsOrg": {
                    "componentId": "mock-student-2_full",
                    "photo": "\(PHOTO_BASE64)",
                    "items": [
                      {
                        "tableItemVerticalMlc": {
                          "label": "Прізвище, ім'я, по батькові",
                          "value": "\(USER_FULL_NAME)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Дата народження",
                          "value": "\(USER_BIRTHDAY)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Форма навчання",
                          "value": "Денна"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Дійсний до",
                          "value": "30.06.2028"
                        }
                      }
                    ]
                  }
                }
              ]
            },
            {
              "id": "mock-passport-3",
              "docNumber": "005823194",
              "order": 3,
              "expirationDate": "12.05.2038",
              "localization": "ua",
              "shareLocalization": "ua",
              "docStatus": 200,
              "docData": {
                "docName": "Паспорт громадянина України",
                "birthday": "\(USER_BIRTHDAY)",
                "category": "",
                "fullName": "\(USER_FULL_NAME)"
              },
              "content": [
                {
                  "code": "photo",
                  "image": "\(PHOTO_BASE64)"
                }
              ],
              "dataForDisplayingInOrderConfigurations": {
                "id": "mock-passport-3",
                "label": "Паспорт громадянина України",
                "description": "Паспорт громадянина України"
              },
              "frontCard": {
                "ua": [
                  {
                    "docHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "Паспорт громадянина України"
                      }
                    },
                    "tableBlockTwoColumnsPlaneOrg": {
                      "componentId": "mock-passport-3_plane",
                      "photo": "\(PHOTO_BASE64)",
                      "items": [
                        {
                          "tableItemVerticalMlc": {
                            "label": "Дата народження:",
                            "value": "\(USER_BIRTHDAY)"
                          }
                        },
                        {
                          "tableItemVerticalMlc": {
                            "label": "Номер:",
                            "value": "005823194"
                          }
                        }
                      ]
                    },
                    "tickerAtm": {
                      "type": "positive",
                      "usage": "grand",
                      "value": "Документ оновлено о \(getUpdatedTimeFormatted()) • Паспорт громадянина України у формі ID-картки • "
                    },
                    "docButtonHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "\(USER_FULL_NAME.replacingOccurrences(of: " ", with: "\\n"))"
                      },
                      "iconAtm": {
                        "code": "ellipseKebab"
                      }
                    }
                  }
                ]
              },
              "fullInfo": [
                {
                  "docHeadingOrg": {
                    "docNumberCopyMlc": {
                      "label": "Паспорт",
                      "value": "005823194"
                    },
                    "headingWithSubtitlesMlc": {
                      "value": "\(USER_FULL_NAME)",
                      "subtitles": ["\(USER_BIRTHDAY) р.н."]
                    }
                  },
                  "tableBlockTwoColumnsOrg": {
                    "componentId": "mock-passport-3_full",
                    "photo": "\(PHOTO_BASE64)",
                    "items": [
                      {
                        "tableItemVerticalMlc": {
                          "label": "Прізвище, ім'я, по батькові",
                          "value": "\(USER_FULL_NAME)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Дата народження",
                          "value": "\(USER_BIRTHDAY)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Номер паспорта",
                          "value": "005823194"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "РНОКПП",
                          "value": "\(USER_RNOKPP)"
                        }
                      }
                    ]
                  }
                }
              ]
            },
            {
              "id": "mock-tax-4",
              "docNumber": "\(USER_RNOKPP)",
              "order": 4,
              "expirationDate": "09.03.2050",
              "localization": "ua",
              "shareLocalization": "ua",
              "docStatus": 200,
              "docData": {
                "docName": "Картка платника податків",
                "birthday": "\(USER_BIRTHDAY)",
                "category": "",
                "fullName": "\(USER_FULL_NAME)"
              },
              "content": [],
              "dataForDisplayingInOrderConfigurations": {
                "id": "mock-tax-4",
                "label": "Картка платника податків",
                "description": "Картка платника податків"
              },
              "frontCard": {
                "ua": [
                  {
                    "docHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "Картка платника податків"
                      }
                    },
                    "tableBlockTwoColumnsPlaneOrg": {
                      "componentId": "mock-tax-4_plane",
                      "items": [
                        {
                          "tableItemVerticalMlc": {
                            "label": "РНОКПП",
                            "value": "\(USER_RNOKPP)"
                          }
                        },
                        {
                          "tableItemVerticalMlc": {
                            "label": "Дата народження",
                            "value": "\(USER_BIRTHDAY)"
                          }
                        }
                      ]
                    },
                    "tickerAtm": {
                      "type": "positive",
                      "usage": "grand",
                      "value": "Перевірено Державною податковою службою України • "
                    },
                    "docButtonHeadingOrg": {
                      "headingWithSubtitlesMlc": {
                        "value": "\(USER_FULL_NAME.replacingOccurrences(of: " ", with: "\\n"))"
                      },
                      "iconAtm": {
                        "code": "ellipseKebab"
                      }
                    }
                  }
                ]
              },
              "fullInfo": [
                {
                  "docHeadingOrg": {
                    "docNumberCopyMlc": {
                      "label": "РНОКПП",
                      "value": "\(USER_RNOKPP)"
                    },
                    "headingWithSubtitlesMlc": {
                      "value": "\(USER_FULL_NAME)",
                      "subtitles": ["\(USER_BIRTHDAY) р.н."]
                    }
                  },
                  "tableBlockTwoColumnsOrg": {
                    "componentId": "mock-tax-4_full",
                    "items": [
                      {
                        "tableItemVerticalMlc": {
                          "label": "Прізвище, ім'я, по батькові",
                          "value": "\(USER_FULL_NAME)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "Дата народження",
                          "value": "\(USER_BIRTHDAY)"
                        }
                      },
                      {
                        "tableItemVerticalMlc": {
                          "label": "РНОКПП",
                          "value": "\(USER_RNOKPP)"
                        }
                      }
                    ]
                  }
                }
              ]
            }
          ]
        }
        """

        guard let data = jsonString.data(using: .utf8) else { return nil }
        do {
            return try JSONDecoder().decode(DSFullDocumentModel.self, from: data)
        } catch {
            return nil
        }
    }
}
