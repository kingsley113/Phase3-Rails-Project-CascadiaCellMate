class CoordinateValidator < ActiveModel::Validator
	def validate(record)
		duplicate_cell = Cell.where(ck_coordinate_x: record.ck_coordinate_x).where(ck_coordinate_y: record.ck_coordinate_y)

		unless duplicate_cell.empty?
			unless record.id == duplicate_cell.first.id
				record.errors[:cell] << "already exists at these coordinates."
			end
		end
	end
end