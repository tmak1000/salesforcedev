/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApplicantFeedPostBatchHelper {
    
    /**
     * コンストラクタ
     */
    public ApplicantFeedPostBatchHelper() {
        
    }

    /**
     * Chatter Post
     */
    public Boolean postChatterMessage(List<Applicant__c> applicants, CollaborationGroup chatterGroup) {
        
        for (Applicant__c applicant : applicants) {
            // new connect api
            ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();    
            ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
            ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
            ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
            ConnectApi.FeedElementCapabilitiesInput feedElementCapabilitiesInput = new ConnectApi.FeedElementCapabilitiesInput();
            // new List
            messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

            String fullName = applicant.FullName__c != null
                                        ? applicant.FullName__c : '';
            Integer devYear = applicant.DevelopmentExperienceYear__c != null
                                        ? applicant.DevelopmentExperienceYear__c.IntValue() : 0;
            Integer age = applicant.Age__c != null
                                    ? applicant.Age__c.IntValue() : 0;

            // Post Message
            String post = System.Label.PostMessage;
            post += '\n';
            post += System.Label.ApplicantName + System.Label.Colon + ' ' + fullName;
            post += '\n';
            post += System.Label.DevelopmentHistory + System.Label.Colon + ' ' + String.valueOf(devYear) + System.Label.Year;
            post += '\n';
            post += System.Label.Age + System.Label.Colon + ' ' + String.valueOf(age) + System.Label.YearOld;
            post += '\n';

            // textSegment set
            textSegmentInput.text = post;
            messageBodyInput.messageSegments.add(textSegmentInput);
            
            // feedItem set
            feedItemInput.body = messageBodyInput;
            feedItemInput.feedElementType = ConnectApi.FeedElementType.FeedItem;

            // Use a group ID for the subject ID.
            feedItemInput.subjectId = applicant.Id;

            // capabilities
            feedElementCapabilitiesInput.link = new ConnectApi.LinkCapabilityInput();
            feedElementCapabilitiesInput.link.url = '/' + applicant.Id;
            feedElementCapabilitiesInput.link.urlName = applicant.FullName__c;
            feedItemInput.capabilities = feedElementCapabilitiesInput;

            // Mention a group.
            mentionSegmentInput.id = chatterGroup.Id;
            messageBodyInput.messageSegments.add(mentionSegmentInput);

            // Chatter Post
            ConnectApi.FeedElement feedElement = ConnectApi.ChatterFeeds.postFeedElement(null, feedItemInput, null);
        }

        return false;
    }

    /**
     * 更新情報取得
     */
    public void getUpdateApplicant(List<Applicant__c> applicants) {
        
        for (Applicant__c a : applicants) {
            a.IsPost__c = true;
        }
    }
}