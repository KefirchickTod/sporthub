module Teams
  class Delete < Service
    def initialize(id)
      @id = id
    end

    # Just delete team
    def call
      raise "Error to delete" unless find.destroy
    end

    private

    # Find team by id
    # @return[Team]
    def find
      teams = Team.find(@id)

      raise "Cant find team with id: [#{id}]" unless teams.present?

      teams
    end
  end
end
