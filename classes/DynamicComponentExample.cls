public class DynamicComponentExample {

    public DynamicComponentExample(CampusApprovalEntryController controller) {

    }

    public DynamicComponentExample(ApexPages.StandardController con) { }
            public Component.Apex.SectionHeader getHeaderWithDueDateCheck() {
            date dueDate = date.newInstance(2011, 7, 4);
            boolean overdue = date.today().daysBetween(dueDate) < 0;
            Component.Apex.SectionHeader sectionHeader = new Component.Apex.SectionHeader();
            if (overdue) {
            sectionHeader.title = 'This Form Was Due On ' + dueDate.format() + '!';
            return sectionHeader;
            } else {
            sectionHeader.title = 'Form Submission';
            return sectionHeader;
        }
    }
    public  Component.Apex.OutputText  getText(){
        Component.Apex.OutputText head1 = new Component.Apex.OutputText();
        head1.escape = false;
        String text = 'aaa';
        head1.value = '<tr><th>申請区分</th><td>' + text + '</td></tr>';
        head1.value += '<tr><th>申請区分</th><td>' + text + '</td></tr>';
        return head1;
    }
    


}