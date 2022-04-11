package team.project.mapper;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	public void updatePoint(@Param("point") int point, @Param("member_index") int member_index);
}
