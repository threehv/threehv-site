# This defines a deployment "recipe" that you can feed to capistrano
# (http://manuals.rubyonrails.com/read/book/17). It allows you to automate
# (among other things) the deployment of your application.

# =============================================================================
# REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The deploy_to path must be the path on each machine that will
# form the root of the application path.

set :application, "threehv"
set :repository, " http://threehv.svnrepository.com/svn/threehv/website/trunk"

# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.

role :web, '3hv.co.uk'
role :app, '3hv.co.uk'
role :db, '3hv.co.uk', :primary => true

# =============================================================================
# OPTIONAL VARIABLES
# =============================================================================
# set :deploy_to, "/path/to/app" # defaults to "/u/apps/#{application}"
# set :user, "flippy"            # defaults to the currently logged in user
# set :scm, :darcs               # defaults to :subversion
# set :svn, "/path/to/svn"       # defaults to searching the PATH
# set :darcs, "/path/to/darcs"   # defaults to searching the PATH
# set :cvs, "/path/to/cvs"       # defaults to searching the PATH
# set :gateway, "gate.host.com"  # default to no gateway

set :user, 'threehvc'
set :deploy_to, '/home/threehvc/applications/threehv'
set :use_sudo, false
set :check_out, 'export'

# =============================================================================
# SSH OPTIONS
# =============================================================================
# ssh_options[:keys] = %w(/path/to/my/key /path/to/another/key)
# ssh_options[:port] = 25

# =============================================================================
# TASKS
# =============================================================================
# Define tasks that run on all (or only some) of the machines. You can specify
# a role (or set of roles) that each task should be executed on. You can also
# narrow the set of servers to a subset of a role by specifying options, which
# must match the options given for the servers to select (like :primary => true)

task :set_permissions do
  donothing = true
end

#Êthis is the symlinking for file_column, taken from Verb
# task :after_symlink do
#   run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
#   run "find #{release_path}/ -type f -name '*' -exec chmod 644 {} \\;"
#   run "find #{release_path}/ -type f -name '.*' -exec chmod 644 {} \\;"
#   run "find #{release_path}/ -type d -name '*' -exec chmod 755 {} \\;"
#   run "find #{release_path}/ -type d -name '.*' -exec chmod 755 {} \\;"
#   run "find #{release_path}/script -type f -name '*' -exec chmod 755 {} \\;"
#   run "find #{release_path}/public -type f -name 'dispatch.*' -exec chmod 755 {} \\;"
#   run "chmod 755 #{release_path}/public/.htaccess"
# end

