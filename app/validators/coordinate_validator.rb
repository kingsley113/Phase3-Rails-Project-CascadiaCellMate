class CoordinateValidator < ActiveModel::Validator
	def validate(record)
		duplicate_cell = Cell.where(coordinate_x: record.coordinate_x).where(coordinate_y: record.coordinate_y)
		unless duplicate_cell = nil
			record.errors[:coordinate_x] << "There is already a cell at this location"
		end
	end
end