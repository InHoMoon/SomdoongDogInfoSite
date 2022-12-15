package somdoong.admin.dao.face;

import somdoong.admin.dto.Admin;
import somdoong.member.dto.SomDoongMember;
 
public interface AdminDao {
 
    boolean loginCheck(Admin dto) throws Exception;    //로그인을 체크하는 메소드
 
 
    void admin_member_forced_evictionCheck(SomDoongMember dto) throws Exception;    //회원 강제탈퇴 관련 메소드
 
}
