package somdoong.admin.dao.face;

import somdoong.admin.dto.Admin;
import somdoong.member.dto.Member;
 
public interface AdminDao {
 
    boolean loginCheck(Admin dto) throws Exception;    //로그인을 체크하는 메소드
 
 
    void admin_member_forced_evictionCheck(Member dto) throws Exception;    //회원 강제탈퇴 관련 메소드
 
}
