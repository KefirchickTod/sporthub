module Teams
  class Update < Service
    def initialize(id, params)
      @id = id
      @params = params
    end

    # Update and get team
    # @return[Team]
    def call
      team = find(@id)
      raise "Error to update team, error: #{team.errors.messages}" unless team.update(@params)
      team
    end

    private

    # Find teams by id
    # @return[Team]
    def find(id)
      Team.find(id)
    end
  end
end
