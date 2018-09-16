//
//  RouterSpec.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/16/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CoordinatorKit

class RouterSpec: QuickSpec {

    override func spec() {

        describe("RouterSpec") {

            var router: RouterMock!

            var firstController: FirstViewController!
            var secondController: SecondViewController!
            var thirdController: ThirdViewController!

            beforeEach {
                router = RouterMock()
                firstController = FirstViewController()
                secondController = SecondViewController()
                thirdController = ThirdViewController()

                router.setRootModule(firstController)
            }

            it("is navigation controller") {
                expect(router.toPresentable()).to(beAKindOf(NavigationViewController.self))
            }

            it("set root module") {
                expect(router.navigationStack.first).to(beAKindOf(FirstViewController.self))
            }

            it("has root controller") {
                expect(router.hasRootController).to(beTrue())
            }

            it("push view module") {
                router.push(secondController)
                expect(router.navigationStack.last).to(beAKindOf(SecondViewController.self))
            }

            it("with completion") {
                var isCompletion: Bool = false
                let completion: () -> Void = {
                    isCompletion = true
                }

                router.push(secondController, animated: false, completion: completion)
                router.popModule(animated: false)
                expect(isCompletion).to(beTrue())
            }

            it("pop view module") {
                router.push(secondController)
                expect(router.navigationStack.last).to(beAKindOf(SecondViewController.self))

                router.popModule()
                expect(router.navigationStack.last).to(beAKindOf(FirstViewController.self))
            }

            it("pop to root view module") {
                router.push(secondController)
                expect(router.navigationStack.last).to(beAKindOf(SecondViewController.self))

                router.push(thirdController)
                expect(router.navigationStack.last).to(beAKindOf(ThirdViewController.self))

                router.popToRootModule(animated: false)
                expect(router.navigationStack.last).to(beAKindOf(FirstViewController.self))
            }

            it("present view module") {
                router.present(secondController)
                expect(router.presented).to(beAKindOf(SecondViewController.self))
            }

            it("dismiss view module") {
                router.present(secondController)
                expect(router.presented).to(beAKindOf(SecondViewController.self))

                router.dismissModule()
                expect(router.presented).to(beNil())
            }
        }
    }
}

class NavigationViewController: UINavigationController {}
class FirstViewController: UIViewController {}
class SecondViewController: UIViewController {}
class ThirdViewController: UIViewController {}

