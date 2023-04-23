//
//  ViewModel.swift
//  ArrayDemo
//
//  Created by Johnny1 on 23/3/2023.
//

import Foundation
class ArrayViewModel : ObservableObject{
    @Published private(set) var policyList: [LAPolicy]?
    var sosNumber : String {
        return setSosNumber(DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-23-2023")!)
    }
    private func setSosNumber(_ nowT : Date = Date()) -> String {

        let underWriter = sanitize(activePolicies)
        
        if underWriter.count == 0 {
            return fallbackSosNumber()
        }else{
            let policiesThatContainsToday = underWriter.filter { nowT >= $0.startDate && nowT <= $0.endDate}
            if policiesThatContainsToday.count == 0 {
                print("no policies contains today found")
                guard let underWriterCode = closestDateLogic(underWriter, nowT: nowT) else { return fallbackSosNumber()}
                return mapSosNumber(underwriterCode: underWriterCode)
            }else if policiesThatContainsToday.count == 1 {
                print("1 policy found")
                guard let underwriterCode = policiesThatContainsToday.first?.underWriter else { return "phone number N/A" }
                return mapSosNumber(underwriterCode: underwriterCode)
            }else{
                print("more than 2 policies found")
                guard let underWriterCode = closestDateLogic(policiesThatContainsToday, nowT: nowT) else { return fallbackSosNumber()}
                return mapSosNumber(underwriterCode: underWriterCode)
            }
        }
    }
    private func sanitize(_ policies : [LAPolicy]) -> [Underwriter]{
        let underWriter = activePolicies.filter{ $0.number != nil && $0.startDate != nil && $0.endDate != nil && $0.underwriterCode != nil}.map {
            Underwriter(policyNumber: $0.number!, startDate: $0.startDate!, endDate: $0.endDate!, underWriter: $0.underwriterCode!)
        }
        return underWriter
    }
    private func closestDateLogic(_ policies : [Underwriter], nowT: Date) -> String? {
        
        let policy = policies.sorted {
            min(abs($0.startDate.timeIntervalSince(nowT)), abs($0.endDate.timeIntervalSince(nowT))) < min(abs($1.startDate.timeIntervalSince(nowT)), abs($1.endDate.timeIntervalSince(nowT)))
        }
        print(policy)
        return policy.first?.underWriter
    }
    private func fallbackSosNumber() -> String{
        print("fallback")
        guard let underwriterCode = activePolicies.first?.underwriterCode else { return "phone number N/A" }
        return mapSosNumber(underwriterCode: underwriterCode)
    }
    private func mapSosNumber(underwriterCode : String) -> String{
        return underwriterCode
        var sosNumber: String
        if underwriterCode == "BH" {
            sosNumber = "+14164798059"
        } else if underwriterCode == "ZU" {
            sosNumber = "+14169459157"
        } else {
            sosNumber = "+14169459157"
        }
        return sosNumber
    }
    init()  {
        var policys = [LAPolicy]()
        let datesArray: [(Date, Date)] = [(DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-01-2023")!,      DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-20-2023")!),
                                          (DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-24-2023")!, DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-30-2023")!),
                                          (DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-01-2023")!, DateFormatter.fullUSDateWithoutZoneFormatter.date(from: "03-27-2023")!)]
        for i in 0 ... 2 {
            policys.append(LAPolicy(friendlyName: "xxx", number: "TSB202100\(i)", destination: "Melbourne", startDate: datesArray[i].0, endDate: datesArray[i].1, isSelected: false, status: 1, primaryTravellerFirstName: "iOS", primaryTravellerLastName: "Tester", underwriterCode: "TSB202100\(i)"))
        }
        policyList = policys
        
    }
    var sortedPolicies: [LAPolicy] {
        guard let policies = policyList else { return [LAPolicy]() }

        return policies.sorted {
            LAPolicy.sortLogic($0, $1)
        }
    }

    var activePolicies: [LAPolicy] {
        return sortedPolicies.filter {
            $0.isActive
        }
    }
}
struct Underwriter{
    let policyNumber: String
    let startDate: Date
    let endDate: Date
    let underWriter: String
}
extension DateFormatter {
    @nonobjc static let dayNameDayNumberMonthYearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMM yyyy"
        return dateFormatter
    }()

    @nonobjc static let yearMonthDayHourMinuteSecondFormatterWithLocalTimeZone: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()

    @nonobjc static let monthDayHourMinuteSecondMilliSecondFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm:ss.SSSS"
        return dateFormatter
    }()

    @nonobjc static let dateMonthYearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yy"
        return dateFormatter
    }()

    @nonobjc static let yearMonthDayHourMinuteSecondMilliSecondFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return dateFormatter
    }()

    @nonobjc static let yearMonthDateFormatterWithLocalTimeZone: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    @nonobjc static let monthFullyearHourMinuteGMTFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MMM yyyy - HH:mm"
        return dateFormatter
    }()

    @nonobjc static let timeHourMinuteFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter
    }()

    @nonobjc static let utcFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        /// The Pega system will be consuming this date and it requires
        /// an appended "Z" to indicate that it is UTC standard.
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }()

    @nonobjc static let fullUSDateTimeWithoutZoneAndTFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    @nonobjc static let fullUSDateTimeWithoutZoneFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    @nonobjc static let fullUSDateWithoutZoneFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    @nonobjc static let fullUSDateWithoutZoneDisplayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    @nonobjc static let dayMonthFullYearHourMinuteAtFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy' at 'hh:mm a"
        return dateFormatter
    }()

    @nonobjc static let dayNameDayMonthFullYearHourMinuteAtFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MMM yyyy' at 'hh:mm a"
        return dateFormatter
    }()
}
