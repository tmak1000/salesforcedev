trigger Account_After_Insert_Trg on Account (after insert) {
	Group gr = new Group(Name='Test',Type='Regular');
    insert gr;
}