import Foundation
import ClockKit

class Cowmplication: NSObject, CLKComplicationDataSource {
    
    func getCurrentReleaseCount() -> Int {
        return ExtensionDelegate.sharedInstance.getnumberCount()
    }
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Update hourly
        handler(NSDate(timeIntervalSinceNow: 60*1))
    }
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        var template: CLKComplicationTemplate? = nil
        switch complication.family {
        case .ModularSmall:
            template = nil
        case .ModularLarge:
            template = nil
        case .UtilitarianSmall:
            template = nil
        case .UtilitarianLarge:
            template = nil
        case .CircularSmall:
            let modularTemplate = CLKComplicationTemplateCircularSmallRingText()
            modularTemplate.textProvider = CLKSimpleTextProvider(text: "--")
            modularTemplate.fillFraction = 0.3
            modularTemplate.ringStyle = CLKComplicationRingStyle.Closed
            template = modularTemplate
        }
        handler(template)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(CLKComplicationPrivacyBehavior.ShowOnLockScreen)
    }
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimelineEntry?) -> Void) {
        
        if complication.family == .CircularSmall {
            let template = CLKComplicationTemplateCircularSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "\(getCurrentReleaseCount())")
            template.fillFraction = Float(10 / 100)
            template.ringStyle = CLKComplicationRingStyle.Closed
            
            let timelineEntry = CLKComplicationTimelineEntry(date: NSDate(), complicationTemplate: template)
            handler(timelineEntry)
        } else {
            handler(nil)
        }
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: ([CLKComplicationTimelineEntry]?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: ([CLKComplicationTimelineEntry]?) -> Void) {
        handler([])
    }
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([CLKComplicationTimeTravelDirections.None])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(NSDate())
    }
}