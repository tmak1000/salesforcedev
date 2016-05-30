trigger Account_Before_Delete_Trg on Account (before delete) {
	Util.deleteGroup('Test');
}