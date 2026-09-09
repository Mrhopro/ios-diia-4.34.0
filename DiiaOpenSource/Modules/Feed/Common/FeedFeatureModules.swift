import UIKit
import DiiaMVPModule
import DiiaUIComponents
import DiiaCommonTypes

// MARK: - Helper UI Builder for Feature Screens
class FeatureDetailViewController: UIViewController, BaseView {
    
    private let screenTitle: String
    private let subtitle: String?
    private let badgeText: String?
    private let sections: [(title: String, items: [(label: String, value: String)])]
    private let buttonTitle: String?
    private let onButtonTap: (() -> Void)?
    
    init(title: String,
         subtitle: String? = nil,
         badgeText: String? = nil,
         sections: [(title: String, items: [(label: String, value: String)])] = [],
         buttonTitle: String? = nil,
         onButtonTap: (() -> Void)? = nil) {
        self.screenTitle = title
        self.subtitle = subtitle
        self.badgeText = badgeText
        self.sections = sections
        self.buttonTitle = buttonTitle
        self.onButtonTap = onButtonTap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0.08, alpha: 1.0)
        
        // Navigation Header
        let navBar = UIView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        let backButton = UIButton(type: .system)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navBar.addSubview(backButton)
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = screenTitle
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        navBar.addSubview(titleLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 44),
            
            backButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor, constant: 8),
            
            scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
        
        // Subtitle card if present
        if let subtitle = subtitle {
            let cardView = UIView()
            cardView.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
            cardView.layer.cornerRadius = 16
            
            let cardStack = UIStackView()
            cardStack.axis = .vertical
            cardStack.spacing = 8
            cardStack.translatesAutoresizingMaskIntoConstraints = false
            cardView.addSubview(cardStack)
            
            if let badge = badgeText {
                let badgeLabel = UILabel()
                badgeLabel.text = "  \(badge)  "
                badgeLabel.font = UIFont.systemFont(ofSize: 11, weight: .bold)
                badgeLabel.textColor = .black
                badgeLabel.backgroundColor = UIColor(red: 0.85, green: 0.95, blue: 0.75, alpha: 1.0)
                badgeLabel.layer.cornerRadius = 6
                badgeLabel.clipsToBounds = true
                badgeLabel.setContentHuggingPriority(.required, for: .horizontal)
                
                let badgeContainer = UIView()
                badgeContainer.addSubview(badgeLabel)
                badgeLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    badgeLabel.topAnchor.constraint(equalTo: badgeContainer.topAnchor),
                    badgeLabel.leadingAnchor.constraint(equalTo: badgeContainer.leadingAnchor),
                    badgeLabel.bottomAnchor.constraint(equalTo: badgeContainer.bottomAnchor),
                    badgeLabel.heightAnchor.constraint(equalToConstant: 20)
                ])
                cardStack.addArrangedSubview(badgeContainer)
            }
            
            let subLabel = UILabel()
            subLabel.text = subtitle
            subLabel.textColor = .white
            subLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            subLabel.numberOfLines = 0
            cardStack.addArrangedSubview(subLabel)
            
            NSLayoutConstraint.activate([
                cardStack.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
                cardStack.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
                cardStack.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
                cardStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
            ])
            stackView.addArrangedSubview(cardView)
        }
        
        // Sections
        for section in sections {
            let sectionTitleLabel = UILabel()
            sectionTitleLabel.text = section.title
            sectionTitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            sectionTitleLabel.textColor = .white
            stackView.addArrangedSubview(sectionTitleLabel)
            
            let sectionCard = UIView()
            sectionCard.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
            sectionCard.layer.cornerRadius = 16
            
            let itemsStack = UIStackView()
            itemsStack.axis = .vertical
            itemsStack.spacing = 12
            itemsStack.translatesAutoresizingMaskIntoConstraints = false
            sectionCard.addSubview(itemsStack)
            
            for item in section.items {
                let row = UIStackView()
                row.axis = .vertical
                row.spacing = 2
                
                let lbl = UILabel()
                lbl.text = item.label
                lbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
                lbl.textColor = UIColor(white: 0.65, alpha: 1.0)
                lbl.numberOfLines = 0
                
                let val = UILabel()
                val.text = item.value
                val.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                val.textColor = .white
                val.numberOfLines = 0
                
                row.addArrangedSubview(lbl)
                row.addArrangedSubview(val)
                itemsStack.addArrangedSubview(row)
            }
            
            NSLayoutConstraint.activate([
                itemsStack.topAnchor.constraint(equalTo: sectionCard.topAnchor, constant: 16),
                itemsStack.leadingAnchor.constraint(equalTo: sectionCard.leadingAnchor, constant: 16),
                itemsStack.trailingAnchor.constraint(equalTo: sectionCard.trailingAnchor, constant: -16),
                itemsStack.bottomAnchor.constraint(equalTo: sectionCard.bottomAnchor, constant: -16)
            ])
            stackView.addArrangedSubview(sectionCard)
        }
        
        // Button
        if let buttonTitle = buttonTitle {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            button.backgroundColor = .white
            button.layer.cornerRadius = 14
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func backTapped() {
        if let nav = navigationController, nav.viewControllers.count > 1 {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    @objc private func actionButtonTapped() {
        if let onButtonTap = onButtonTap {
            onButtonTap()
        } else {
            let alert = UIAlertController(title: "Дія", message: "Запит успішно оброблено!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Зрозуміло", style: .default))
            present(alert, animated: true)
        }
    }
}

// MARK: - Polls Module
final class PollsModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Опитування",
            subtitle: "Беріть участь у державних опитуваннях та впливайте на рішення в країні прямо у застосунку Дія.",
            badgeText: "АКТИВНЕ",
            sections: [
                (
                    title: "Оберіть фіналіста Нацвідбору на Євробачення-2024",
                    items: [
                        ("Статус", "Голосування триває"),
                        ("1", "ANKA — «Палала»"),
                        ("2", "Carpetman — «Endless fight»"),
                        ("3", "KRYLATA — «Queen»"),
                        ("4", "PARFENIUK — «Серед вітрів»"),
                        ("5", "SHUMEI — «Тихий дощ»"),
                        ("6", "YAGODY — «Tsunamia»"),
                        ("7", "Ziferblat — «Place I Call Home»")
                    ]
                ),
                (
                    title: "Завершені опитування",
                    items: [
                        ("Яка марка Укрпошти краща?", "Переможець: «Русскій воєнний корабль, іді...»"),
                        ("Коли святкувати Різдво?", "Переможець: 25 грудня (60.34%)")
                    ]
                )
            ],
            buttonTitle: "Проголосувати",
            onButtonTap: nil
        )
    }
}

// MARK: - FOP Taxes Module
final class FopTaxesModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Податки ФОП",
            subtitle: "Сплата єдиного податку, ЄСВ та подання податкової декларації платника єдиного податку 3 групи.",
            badgeText: "3 ГРУПА 5%",
            sections: [
                (
                    title: "Стан розрахунків",
                    items: [
                        ("Заборгованість", "Відсутня"),
                        ("Переплата", "0.00 грн")
                    ]
                ),
                (
                    title: "Поточні платежі",
                    items: [
                        ("Єдиний податок (5%)", "Термін: до 20 травня 2025"),
                        ("ЄСВ (1 760 грн/місяць)", "Термін: щокварталу (до 19 числа)"),
                        ("Реквізити для сплати", "ГУ ДПС у м. Києві, UA448999980314050543000026001")
                    ]
                )
            ],
            buttonTitle: "Сплатити податки",
            onButtonTap: nil
        )
    }
}

// MARK: - Military Bonds Module
final class MilitaryBondsModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Військові облігації",
            subtitle: "Інвестуйте в перемогу України. 100% повернення коштів гарантовано державою. Жодних комісій.",
            badgeText: "ДО 18% РІЧНИХ",
            sections: [
                (
                    title: "Доступні облігації",
                    items: [
                        ("Бахмут", "Виплата: 21.05.2025 • Дохідність: 17.5% річних"),
                        ("Ялта", "Виплата: 26.06.2025 • Дохідність: 18.0% річних"),
                        ("Мелітополь", "Виплата: 10.09.2025 • Дохідність: 16.8% річних"),
                        ("Маріуполь", "Виплата: 15.11.2025 • Дохідність: 17.0% річних")
                    ]
                ),
                (
                    title: "Куди йдуть кошти",
                    items: [
                        ("Призначення", "Закупівля зброї, боєприпасів, медикаментів та підтримка ЗСУ")
                    ]
                )
            ],
            buttonTitle: "Купити облігацію",
            onButtonTap: nil
        )
    }
}

// MARK: - Outage Report Module
final class OutageReportModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Відсутній звʼязок",
            subtitle: "Повідомте про проблеми зі зв'язком або мобільним інтернетом, щоб оператори швидше відновили мережу.",
            badgeText: "ШВИДКИЙ ЗВІТ",
            sections: [
                (
                    title: "Параметри звернення",
                    items: [
                        ("Мобільний оператор", "Визначається автоматично"),
                        ("Тип проблеми", "Повна відсутність зв'язку / Немає 4G/LTE"),
                        ("Адреса", "Поточне місцезнаходження за GPS")
                    ]
                )
            ],
            buttonTitle: "Надіслати звіт",
            onButtonTap: nil
        )
    }
}

// MARK: - Invincibility Points Module
final class InvincibilityPointsModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Незламність",
            subtitle: "Мапа Пунктів Незламності та найближчих укриттів. Тут завжди є світло, тепло, вода та інтернет.",
            badgeText: "ОФЛАЙН ДОСТУП",
            sections: [
                (
                    title: "Найближчий пункт",
                    items: [
                        ("Адреса", "вул. Хрещатик, 26 (350 м від вас)"),
                        ("Графік роботи", "Цілодобово"),
                        ("Зручності", "Генератор, Starlink, обігрів, чай, аптечка")
                    ]
                ),
                (
                    title: "Мапа офлайн",
                    items: [
                        ("Статус мапи", "Завантажено для вашої області")
                    ]
                )
            ],
            buttonTitle: "Відкрити мапу",
            onButtonTap: nil
        )
    }
}

// MARK: - Smart Mobilization / Drones Line Module
final class SmartMobilizationModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Лінія дронів",
            subtitle: "Ініціатива Президента України з масового забезпечення сил оборони ударними FPV-дронами та розвідниками.",
            badgeText: "ЗМІНИТИ ХІД ПОДІЙ",
            sections: [
                (
                    title: "Про проєкт",
                    items: [
                        ("Мета", "1 000 000 дронів для фронту"),
                        ("Результат", "Знищення техніки окупантів та збереження життів воїнів")
                    ]
                )
            ],
            buttonTitle: "Підтримати проєкт",
            onButtonTap: nil
        )
    }
}

// MARK: - Driver License Replacement Module
final class DriverLicenseReplacementModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Заміна посвідчення",
            subtitle: "Подайте заяву на заміну посвідчення водія онлайн у Дії та отримайте пластиковий документ у сервісному центрі МВС або з доставкою.",
            badgeText: "ПОСЛУГА ОНЛАЙН",
            sections: [
                (
                    title: "Коли потрібна заміна",
                    items: [
                        ("Причини", "Закінчення терміну дії, зміна прізвища, втрата чи пошкодження документа")
                    ]
                ),
                (
                    title: "Вартість та терміни",
                    items: [
                        ("Орієнтовна вартість", "Близько 270 грн за бланкову продукцію"),
                        ("Термін виготовлення", "До 5 робочих днів")
                    ]
                )
            ],
            buttonTitle: "Подати заяву",
            onButtonTap: nil
        )
    }
}

// MARK: - Damaged Property Module
final class DamagedPropertyModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Пошкоджене майно",
            subtitle: "Подайте інформаційне повідомлення про пошкоджене або знищене нерухоме майно внаслідок бойових дій для отримання єВідновлення.",
            badgeText: "єВІДНОВЛЕННЯ",
            sections: [
                (
                    title: "Яке майно можна зареєструвати",
                    items: [
                        ("Типи", "Квартири, приватні будинки, дачні та садові будинки"),
                        ("Хто може подати", "Власник нерухомості з зареєстрованим правом власності")
                    ]
                ),
                (
                    title: "Необхідні дані",
                    items: [
                        ("Інформація", "Адреса, площа, фото та опис пошкоджень, контактні дані")
                    ]
                )
            ],
            buttonTitle: "Подати повідомлення",
            onButtonTap: nil
        )
    }
}

