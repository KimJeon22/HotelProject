package net.hb.booking;

public class SelectSort {
	RoomDTO temp = new RoomDTO();

	public RoomDTO SelectSort(RoomDTO dto) {

		for (int i = 0; i < dto.getRl_price().size() - 1; i++) {
			for (int j = i + 1; j < dto.getRl_price().size(); j++) {
				if (dto.getRl_price().get(i) > dto.getRl_price().get(j)) {
					temp.setR_price(dto.getRl_price().get(j));
					dto.rl_price.set(j, dto.getRl_price().get(i));
					dto.rl_price.set(i, temp.getR_price());

					temp.setR_inwon(dto.getRl_inwon().get(j));
					dto.rl_inwon.set(j, dto.getRl_inwon().get(i));
					dto.rl_inwon.set(i, temp.getR_inwon());

					temp.setR_name(dto.getRl_name().get(j));
					dto.rl_name.set(j, dto.getRl_name().get(i));
					dto.rl_name.set(i, temp.getR_name());

					temp.setR_service(dto.getRl_service().get(j));
					dto.rl_service.set(j, dto.getRl_service().get(i));
					dto.rl_service.set(i, temp.getR_service());
				}
			}
		}
		
		return dto;
	}

}
