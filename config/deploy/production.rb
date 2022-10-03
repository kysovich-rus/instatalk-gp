server "bbq-gp.site",
       user: "deploy",
       roles: %w[web app db resque_worker]

set :resque_environment_task, true
set :workers, { "#{fetch(:application)}*" => 1 }
