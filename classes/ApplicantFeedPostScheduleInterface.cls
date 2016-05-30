/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantFeedPostScheduleInterface Implements Schedulable {

    private static final String CONNECT_CLASS = 'ApplicantFeedPostScheduleConnect';

    /**
     * コンストラクタ
     */
    public ApplicantFeedPostScheduleInterface() {
        
    }

    /**
     * Interface
     */
    public Interface IScheduler {
        void execute(SchedulableContext sc);
    }

    /**
     * execute
     */
    public void execute(SchedulableContext sc) {
        Type targetType = Type.forName(CONNECT_CLASS);
        
        if(targetType != null) {
            IScheduler schedule = (IScheduler)targetType.NewInstance();
            schedule.execute(sc);
        }
    }
}