import UIKit
import DiiaMVPModule
import DiiaUIComponents
import DiiaCommonTypes

// MARK: - Diia.ID (Дія.Підпис) Module
final class DiiaIdModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Дія.Підпис",
            subtitle: "Дія.Підпис — кваліфікований електронний підпис, який ви можете використовувати для підписання документів та авторизації в застосунках і на порталах.",
            badgeText: "БЕЗКОШТОВНО",
            sections: [
                (
                    title: "Як отримати підпис",
                    items: [
                        ("1. Пройдіть перевірку", "Швидка біометрична перевірка за фото обличчя"),
                        ("2. Створіть код", "Придумайте 5-значний код для підтвердження підпису"),
                        ("3. Готово", "Підписуйте документи в Дії та на державних онлайн-порталах"),
                        ("4. Термін дії", "Сертифікат діє 1 рік або до видалення")
                    ]
                ),
                (
                    title: "Зверніть увагу",
                    items: [
                        ("Вимоги", "Для створення підпису потрібен біометричний документ — ID-картка або закордонний паспорт")
                    ]
                )
            ],
            buttonTitle: "Активувати Дія.Підпис",
            onButtonTap: nil
        )
    }
}

// MARK: - Signing History (Історія підписань) Module
final class SigningHistoryModule: BaseModule {
    func viewController() -> UIViewController {
        SigningHistoryViewController()
    }
}

final class SigningHistoryViewController: UIViewController, BaseView {
    
    private let segmentedControl = UISegmentedControl(items: ["Авторизації", "Підписання", "Копії документів"])
    private let emptyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0.08, alpha: 1.0)
        
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
        titleLabel.text = "Історія підписань"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        navBar.addSubview(titleLabel)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(white: 0.16, alpha: 1.0)
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .normal)
        view.addSubview(segmentedControl)
        
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.text = "🤷‍♂️\n\nТут поки порожньо\n\nІсторія з'явиться після першого підписання документа або надання цифрової копії."
        emptyLabel.textColor = UIColor(white: 0.65, alpha: 1.0)
        emptyLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        emptyLabel.textAlignment = .center
        emptyLabel.numberOfLines = 0
        view.addSubview(emptyLabel)
        
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
            
            segmentedControl.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 36),
            
            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emptyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    
    @objc private func backTapped() {
        if let nav = navigationController, nav.viewControllers.count > 1 {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}

// MARK: - App Sessions (Підключені пристрої) Module
final class AppSessionsModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Підключені пристрої",
            subtitle: "Керуйте активними сесіями вашого облікового запису Дії на смартфонах та планшетах.",
            badgeText: "ЦЕЙ ПРИСТРІЙ",
            sections: [
                (
                    title: "Поточна сесія",
                    items: [
                        ("Пристрій", "iPhone (Цей пристрій)"),
                        ("Застосунок", "Дія 4.34.0"),
                        ("Статус", "Активно зараз"),
                        ("Спосіб входу", "BankID"),
                        ("Місто", "Київ, Україна")
                    ]
                )
            ],
            buttonTitle: "Завершити інші сесії",
            onButtonTap: nil
        )
    }
}

// MARK: - App Update (Оновити застосунок) Module
final class AppUpdateModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Оновлення застосунку",
            subtitle: "У вас встановлена найновіша актуальна версія Дії. Автоматичні оновлення забезпечують надійний захист даних.",
            badgeText: "ВЕРСІЯ 4.34.0",
            sections: [
                (
                    title: "Статус версії",
                    items: [
                        ("Поточна версія", "4.34.0"),
                        ("Останнє оновлення", "Оновлено до останньої доступної версії"),
                        ("Безпека", "Криптографічні бібліотеки оновлено")
                    ]
                )
            ],
            buttonTitle: "Перевірити оновлення",
            onButtonTap: nil
        )
    }
}

// MARK: - FAQ (Питання та відповіді) Module
final class FAQModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Питання та відповіді",
            subtitle: "Відповіді на найпоширеніші запитання про документи, послуги та Дія.Підпис.",
            badgeText: "ДОВІДКА ДІЇ",
            sections: [
                (
                    title: "Документи",
                    items: [
                        ("Відображення документів", "Документи підтягуються з відповідних державних реєстрів автоматично."),
                        ("Юридична сила", "Електронні документи в Дії мають таку саму юридичну силу, як і паперові чи пластикові аналоги.")
                    ]
                ),
                (
                    title: "Дія.Підпис",
                    items: [
                        ("Як створити", "Перейдіть у Меню -> Дія.Підпис, підтвердіть особу за фото та встановіть 5-значний PIN."),
                        ("Де використовувати", "Для авторизації та підписання заяв на порталі Дія та ресурсах партнерів.")
                    ]
                ),
                (
                    title: "Безпека",
                    items: [
                        ("Зберігання даних", "Дія не зберігає персональні дані на серверах — вони передаються з реєстрів у зашифрованому вигляді напряму на ваш смартфон.")
                    ]
                )
            ],
            buttonTitle: "Звернутися до підтримки",
            onButtonTap: nil
        )
    }
}

// MARK: - Notifications Module
final class NotificationsModule: BaseModule {
    func viewController() -> UIViewController {
        FeatureDetailViewController(
            title: "Повідомлення",
            subtitle: "Важливі сповіщення від державних органів, статус послуг та системні повідомлення.",
            badgeText: "СИСТЕМА",
            sections: [
                (
                    title: "Останні",
                    items: [
                        ("Дія OpenSource", "Застосунок готовий до роботи. Всі модулі та мок-дані завантажено."),
                        ("Безпека", "Ви успішно увійшли до застосунку Дія.")
                    ]
                )
            ],
            buttonTitle: "Позначити всі як прочитані",
            onButtonTap: nil
        )
    }
}
