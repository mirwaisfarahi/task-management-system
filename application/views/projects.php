<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Projects &mdash; <?= get_compnay_title(); ?></title>
    <?php include('include-css.php'); ?>

</head>

<body>
    <div id="app">
        <div class="main-wrapper main-wrapper-1">

            <?php include('include-header.php'); ?>

            <!-- Main Content -->
            <div class="main-content">
                <section class="section">
                    <div class="section-header">
                        <h1><?= !empty($this->lang->line('label_projects')) ? $this->lang->line('label_projects') : 'Projects'; ?></h1>
                        <div class="section-header-breadcrumb">

                            <div class="btn-group mr-2 no-shadow">
                                <a class="btn btn-primary text-white"><i class="fas fa-th-large"></i> <?= !empty($this->lang->line('label_grid_view')) ? $this->lang->line('label_grid_view') : 'Grid View'; ?></a>
                                <a href="<?= base_url('projects/lists') ?>" class="btn"><i class="fas fa-list"></i> <?= !empty($this->lang->line('label_list_view')) ? $this->lang->line('label_list_view') : 'List View'; ?></a>
                            </div>
                            <?php if (is_admin() || is_editor()) { ?>
                            <i class="btn btn-primary btn-rounded no-shadow" id="modal-add-project"><?= !empty($this->lang->line('label_create_project')) ? $this->lang->line('label_create_project') : 'Create Project'; ?></i>
                        <?php } ?>
                        </div>
                    </div>

                    <div class="section-body">
                        <div class="row justify-content-center">
                            <div class="text-sm-right status-filter">
                                <div class="btn-group mb-3">
                                    <a href="<?= base_url('projects'); ?>" class="btn btn-light" data-status="All"><?= !empty($this->lang->line('label_all')) ? $this->lang->line('label_all') : 'All'; ?></a>
                                </div>
                                <div class="btn-group mb-3 ml-1">
                                    <a href="<?= base_url('projects?filter=notstarted'); ?>" class="btn btn-light" data-status="notstarted"><?= !empty($this->lang->line('label_notstarted')) ? $this->lang->line('label_notstarted') : 'Not Started'; ?></a>
                                    <a href="<?= base_url('projects?filter=ongoing'); ?>" class="btn btn-light" data-status="ongoing"><?= !empty($this->lang->line('label_ongoing')) ? $this->lang->line('label_ongoing') : 'Ongoing'; ?></a>
                                    <a href="<?= base_url('projects?filter=finished'); ?>" class="btn btn-light" data-status="finished"><?= !empty($this->lang->line('label_finished')) ? $this->lang->line('label_finished') : 'Finished'; ?></a>
                                    <a href="<?= base_url('projects?filter=onhold'); ?>" class="btn btn-light" data-status="onhold"><?= !empty($this->lang->line('label_onhold')) ? $this->lang->line('label_onhold') : 'OnHold'; ?></a>
                                    <a href="<?= base_url('projects?filter=cancelled'); ?>" class="btn btn-light" data-status="cancelled"><?= !empty($this->lang->line('label_cancelled')) ? $this->lang->line('label_cancelled') : 'Cancelled'; ?></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="modal-edit-project"></div>
                            <?php if (!empty($projects)) {
                                foreach ($projects as $project) { ?>

                                    <div class="col-md-6">
                                        <div class="card author-box card-<?= $project['class'] ?>">
                                            <div class="card-body">
                                                <?php if (in_array($user->id, $admin_ids) || is_admin()) { ?>
                                                    <div class="card-header-action float-right">
                                                        <div class="dropdown card-widgets">
                                                            <a href="#" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-cog"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item has-icon modal-edit-project-ajax" href="#" data-id="<?= $project['id'] ?>"><i class="fas fa-pencil-alt"></i> <?= !empty($this->lang->line('label_edit')) ? $this->lang->line('label_edit') : 'Edit'; ?></a>
                                                                <a class="dropdown-item has-icon delete-project-alert" href="<?= base_url('projects/delete/' . $project['id']); ?>" data-project_id="<?= $project['id'] ?>"><i class="far fa-trash-alt"></i> <?= !empty($this->lang->line('label_delete')) ? $this->lang->line('label_delete') : 'Delete'; ?></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                                <div class="author-box-name">
                                                    <a href="<?= base_url('projects/details/' . $project['id']); ?>"><?= $project['title'] ?></a>
                                                </div>
                                                <div class="author-box-job">
                                                    <div class="badge badge-<?= $project['class'] ?> projects-badge"><?= !empty($this->lang->line('label_' . $project['status'])) ? $this->lang->line('label_' . $project['status']) : $project['status']; ?></div>
                                                </div>
                                                <div class="author-box-description">
                                                    <p><?= mb_substr($project['description'], 0, 80); ?></p>
                                                </div>
                                                <div class="mb-2 mt-3">
                                                    <span class="pr-2 mb-2 d-inline-block">
                                                        <i class="text-muted fas fa-tasks"></i>
                                                        <b><?= $project['task_count'] ?></b> <?= !empty($this->lang->line('label_tasks')) ? $this->lang->line('label_tasks') : 'Tasks'; ?>
                                                    </span>
                                                    <span class="mb-2 d-inline-block">
                                                        <i class="text-muted fas fa-comments"></i>
                                                        <b><?= $project['comment_count'] ?></b> <?= !empty($this->lang->line('label_comments')) ? $this->lang->line('label_comments') : 'Comments'; ?>
                                                    </span>
                                                    <div class="w-100 d-sm-none"></div>
                                                    <div class="float-right mt-sm-0 mt-3">
                                                        <a href="<?= base_url('projects/details/' . $project['id']); ?>" class="btn btn-sm btn-primary no-shadow"><?= !empty($this->lang->line('label_details')) ? $this->lang->line('label_details') : 'Details'; ?> <i class="fas fa-chevron-right"></i></a>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <?php if (!empty($project['projects_clients'])) { ?>
                                                        <div class="col-md-6">
                                                            <h6><?= !empty($this->lang->line('label_clients')) ? $this->lang->line('label_clients') : 'Clients'; ?></h6>
                                                            <?php foreach ($project['projects_clients'] as $projects_clients) {

                                                                if (isset($projects_clients['profile']) && !empty($projects_clients['profile'])) { ?>
                                                                    <a href="<?= base_url('users/detail/' . $projects_clients['id']) ?>">
                                                                        <figure class="avatar avatar-md" data-toggle="tooltip" data-title="<?= $projects_clients['first_name'] ?>">
                                                                            <img alt="image" src="<?= base_url('assets/profiles/' . $projects_clients['profile']); ?>" class="rounded-circle">
                                                                        </figure>
                                                                    </a>
                                                                <?php } else { ?>
                                                                    <a href="<?= base_url('users/detail/' . $projects_clients['id']) ?>">
                                                                        <figure data-toggle="tooltip" data-title="<?= $projects_clients['first_name'] ?>" class="avatar avatar-md" data-initial="<?= mb_substr($projects_clients['first_name'], 0, 1) . '' . mb_substr($projects_clients['last_name'], 0, 1); ?>">
                                                                        </figure>
                                                                    </a>
                                                            <?php }
                                                            } ?>
                                                        </div>
                                                    <?php } ?>
                                                    <div class="col-md-6">
                                                        <h6 class="mt-1"><?= !empty($this->lang->line('label_users')) ? $this->lang->line('label_users') : 'Users'; ?></h6>
                                                        <?php foreach ($project['projects_users'] as $projects_users) {

                                                            if (isset($projects_users['profile']) && !empty($projects_users['profile'])) { ?>
                                                                <a href="<?= base_url('users/detail/' . $projects_users['id']) ?>">
                                                                    <figure class="avatar avatar-md" data-toggle="tooltip" data-title="<?= $projects_users['first_name'] ?>">
                                                                        <img alt="image" src="<?= base_url('assets/profiles/' . $projects_users['profile']); ?>" class="rounded-circle">
                                                                    </figure>
                                                                </a>
                                                            <?php } else { ?>
                                                                <a href="<?= base_url('users/detail/' . $projects_users['id']) ?>">
                                                                    <figure data-toggle="tooltip" data-title="<?= $projects_users['first_name'] ?>" class="avatar avatar-md" data-initial="<?= mb_substr($projects_users['first_name'], 0, 1) . '' . mb_substr($projects_users['last_name'], 0, 1); ?>">
                                                                    </figure>
                                                                </a>
                                                        <?php }
                                                        } ?>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="card-footer pt-0">
                                                <h6><?= !empty($this->lang->line('label_task_insights')) ? $this->lang->line('label_task_insights') : 'Tasks Insights'; ?></h6>
                                                <div class="progress">
                                                    <?php if (isset($project['project_progress']) && !empty($project['project_progress'])) {
                                                        foreach ($project['project_progress'] as $progress) { ?>
                                                            <div title="<?= !empty($this->lang->line('label_' . $progress['status'])) ? $this->lang->line('label_' . $progress['status']) : $progress['status']; ?> (<?= $progress['percentage'] ?>%)" class="progress-bar progress-bar-striped bg-<?= $progress_bar_classes[$progress['status']] ?>" role="progressbar" data-width="<?= $progress['percentage'] ?>%" aria-valuenow="<?= $progress['percentage'] ?>" aria-valuemin="0" aria-valuemax="100"> <?= !empty($this->lang->line('label_' . $progress['status'])) ? $this->lang->line('label_' . $progress['status']) : ucwords($progress['status']); ?> (<?= $progress['percentage'] ?>%)</div>
                                                        <?php }
                                                    } else { ?>
                                                        <div class="progress-bar progress-bar-striped bg-dark" role="progressbar" data-width="100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><?= !empty($this->lang->line('label_no_task_assigned')) ? $this->lang->line('label_no_task_assigned') : 'No tasks assigned'; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                <?php }
                            } else {  ?>
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>No Project Found!</h4>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="col-md-12">
                                <?php echo $links; ?>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <form action="<?= base_url('projects/create'); ?>" method="post" class="modal-part" id="modal-add-project-part">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_title')) ? $this->lang->line('label_title') : 'Title'; ?></label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="title" name="title">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_project_number')) ? $this->lang->line('label_project_number') : 'Project ID'; ?></label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Project/Meeting ID" name="project_number">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                            <div class="form-group">
                                <label for="section"><?= !empty($this->lang->line('label_section')) ? $this->lang->line('label_section') : 'Section'; ?></label>
                                <select id="section" name="section" class="form-control">
                                    <option value="">--</option>
                                    <option value="<?= !empty($this->lang->line('label_masawba')) ? $this->lang->line('label_masawba') : 'Masawba'; ?>"><?= !empty($this->lang->line('label_masawba')) ? $this->lang->line('label_masawba') : 'Masawba'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_hedayat')) ? $this->lang->line('label_hedayat') : 'Hedayat'; ?>"><?= !empty($this->lang->line('label_hedayat')) ? $this->lang->line('label_hedayat') : 'Hedayat'; ?></option>
                                </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                            <div class="form-group">
                                <label for="project_type"><?= !empty($this->lang->line('label_project_type')) ? $this->lang->line('label_project_type') : 'Project Type'; ?></label>
                                <select id="project_type" name="project_type" class="form-control">
                                    <option value="<?= !empty($this->lang->line('label_general')) ? $this->lang->line('label_general') : 'General'; ?>"><?= !empty($this->lang->line('label_general')) ? $this->lang->line('label_general') : 'General'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_development')) ? $this->lang->line('label_development') : 'Development'; ?>"><?= !empty($this->lang->line('label_development')) ? $this->lang->line('label_development') : 'Development'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_construction')) ? $this->lang->line('label_construction') : 'Construction'; ?>"><?= !empty($this->lang->line('label_construction')) ? $this->lang->line('label_construction') : 'Construction'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_consultancy')) ? $this->lang->line('label_consultancy') : 'Consultancy'; ?>"><?= !empty($this->lang->line('label_consultancy')) ? $this->lang->line('label_consultancy') : 'Consultancy'; ?></option>
                                </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                            <div class="form-group">
                                <label for="meeting_lead"><?= !empty($this->lang->line('label_meeting_lead')) ? $this->lang->line('label_meeting_lead') : 'Ordered By'; ?></label>
                                <select id="meeting_lead" name="meeting_lead" class="form-control">
                                    
                                    <option value=""> --- </option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_minister')) ? $this->lang->line('label_minister') : 'Minister'; ?>"><?= !empty($this->lang->line('label_minister')) ? $this->lang->line('label_minister') : 'Minister'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_president')) ? $this->lang->line('label_president') : 'President of The Islamic Republic of Afghanistan'; ?>"><?= !empty($this->lang->line('label_president')) ? $this->lang->line('label_president') : 'President of The Islamic Republic of Afghanistan'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_cabinet')) ? $this->lang->line('label_cabinet') : 'Cabinet'; ?>"><?= !empty($this->lang->line('label_cabinet')) ? $this->lang->line('label_cabinet') : 'Cabinet'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_council_of_ministers')) ? $this->lang->line('label_council_of_ministers') : 'The Council of Ministers'; ?>"><?= !empty($this->lang->line('label_council_of_ministers')) ? $this->lang->line('label_council_of_ministers') : 'The Council of Ministers'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_supreme_council_of_the_law')) ? $this->lang->line('label_supreme_council_of_the_law') : 'Supreme Council of the Rule of Law'; ?>"><?= !empty($this->lang->line('label_supreme_council_of_the_law')) ? $this->lang->line('label_supreme_council_of_the_law') : 'Supreme Council of the Rule of Law'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_supreme_economic_council')) ? $this->lang->line('label_supreme_economic_council') : 'Supreme Economic Council'; ?>"><?= !empty($this->lang->line('label_supreme_economic_council')) ? $this->lang->line('label_supreme_economic_council') : 'Supreme Economic Council'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_high_council_of_regional_connection')) ? $this->lang->line('label_high_council_of_regional_connection') : 'High Council of Regional Connection'; ?>"><?= !empty($this->lang->line('label_high_council_of_regional_connection')) ? $this->lang->line('label_high_council_of_regional_connection') : 'High Council of Regional Connection'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_national_procurement_commission')) ? $this->lang->line('label_national_procurement_commission') : 'National Procurement Commission'; ?>"><?= !empty($this->lang->line('label_national_procurement_commission')) ? $this->lang->line('label_national_procurement_commission') : 'National Procurement Commission'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_high_council_of_infrastructure')) ? $this->lang->line('label_high_council_of_infrastructure') : 'High Council of Infrastructure'; ?>"><?= !empty($this->lang->line('label_high_council_of_infrastructure')) ? $this->lang->line('label_high_council_of_infrastructure') : 'High Council of Infrastructure'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_high_council_for_poverty_reduction')) ? $this->lang->line('label_high_council_for_poverty_reduction') : 'High Council for Poverty Reduction'; ?>"><?= !empty($this->lang->line('label_high_council_for_poverty_reduction')) ? $this->lang->line('label_high_council_for_poverty_reduction') : 'High Council for Poverty Reduction'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs')) ? $this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs') : 'Scientific, Cultural and Human Resources Council, Office of Affairs'; ?>"><?= !empty($this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs')) ? $this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs') : 'Scientific, Cultural and Human Resources Council, Office of Affairs'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_directorate_of_national_security')) ? $this->lang->line('label_directorate_of_national_security') : 'Directorate of National Security'; ?>"><?= !empty($this->lang->line('label_directorate_of_national_security')) ? $this->lang->line('label_directorate_of_national_security') : 'Directorate of National Security'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_finance')) ? $this->lang->line('label_ministry_of_finance') : 'Ministry of Finance'; ?>"><?= !empty($this->lang->line('label_ministry_of_finance')) ? $this->lang->line('label_ministry_of_finance') : 'Ministry of Finance'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_interior')) ? $this->lang->line('label_ministry_of_interior') : 'Ministry of Interior'; ?>"><?= !empty($this->lang->line('label_ministry_of_interior')) ? $this->lang->line('label_ministry_of_interior') : 'Ministry of Interior'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_mines_and_petroleum')) ? $this->lang->line('label_ministry_of_mines_and_petroleum') : 'Ministry of Mines and Petroleum'; ?>"><?= !empty($this->lang->line('label_ministry_of_mines_and_petroleum')) ? $this->lang->line('label_ministry_of_mines_and_petroleum') : 'Ministry of Mines and Petroleum'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_economy')) ? $this->lang->line('label_ministry_of_economy') : 'Ministry of Economy'; ?>"><?= !empty($this->lang->line('label_ministry_of_economy')) ? $this->lang->line('label_ministry_of_economy') : 'Ministry of Economy'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_foreign_affairs')) ? $this->lang->line('label_ministry_of_foreign_affairs') : 'Ministry of Foreign Affairs'; ?>"><?= !empty($this->lang->line('label_ministry_of_foreign_affairs')) ? $this->lang->line('label_ministry_of_foreign_affairs') : 'Ministry of Foreign Affairs'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_rural_rehabilitation_and_development')) ? $this->lang->line('label_ministry_of_rural_rehabilitation_and_development') : 'Ministry of Rural Rehabilitation and Development'; ?>"><?= !empty($this->lang->line('label_ministry_of_rural_rehabilitation_and_development')) ? $this->lang->line('label_ministry_of_rural_rehabilitation_and_development') : 'Ministry of Rural Rehabilitation and Development'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock')) ? $this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock') : 'Ministry of Agriculture, Irrigation and Livestock'; ?>"><?= !empty($this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock')) ? $this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock') : 'Ministry of Agriculture, Irrigation and Livestock'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_councilor_of_the_ministry_of_finance')) ? $this->lang->line('label_councilor_of_the_ministry_of_finance') : 'Councilor of the Ministry of Finance'; ?>"><?= !empty($this->lang->line('label_councilor_of_the_ministry_of_finance')) ? $this->lang->line('label_councilor_of_the_ministry_of_finance') : 'Councilor of the Ministry of Finance'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_urban_development_and_housing')) ? $this->lang->line('label_ministry_of_urban_development_and_housing') : 'Ministry of Urban Development and Housing'; ?>"><?= !empty($this->lang->line('label_ministry_of_urban_development_and_housing')) ? $this->lang->line('label_ministry_of_urban_development_and_housing') : 'Ministry of Urban Development and Housing'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_commerce_and_industry')) ? $this->lang->line('label_ministry_of_commerce_and_industry') : 'Ministry of Commerce and Industry'; ?>"><?= !empty($this->lang->line('label_ministry_of_commerce_and_industry')) ? $this->lang->line('label_ministry_of_commerce_and_industry') : 'Ministry of Commerce and Industry'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_ministry_of_justice')) ? $this->lang->line('label_ministry_of_justice') : 'Ministry of Justice'; ?>"><?= !empty($this->lang->line('label_ministry_of_justice')) ? $this->lang->line('label_ministry_of_justice') : 'Ministry of Justice'; ?></option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_other')) ? $this->lang->line('label_other') : 'Other'; ?>"><?= !empty($this->lang->line('label_other')) ? $this->lang->line('label_other') : 'Other'; ?></option>
                                    
                                </select>
                        </div>
                    </div>
                    
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status"><?= !empty($this->lang->line('label_status')) ? $this->lang->line('label_status') : 'Status'; ?></label>
                                    <select id="status" name="status" class="form-control">
                                        <option value="notstarted"><?= !empty($this->lang->line('label_notstarted')) ? $this->lang->line('label_notstarted') : 'Not Started'; ?></option>
                                        <option value="ongoing"><?= !empty($this->lang->line('label_ongoing')) ? $this->lang->line('label_ongoing') : 'Ongoing'; ?></option>
                                        <option value="finished"><?= !empty($this->lang->line('label_finished')) ? $this->lang->line('label_finished') : 'Finished'; ?></option>
                                        <option value="onhold"><?= !empty($this->lang->line('label_onhold')) ? $this->lang->line('label_onhold') : 'OnHold'; ?></option>
                                        <option value="cancelled"><?= !empty($this->lang->line('label_cancelled')) ? $this->lang->line('label_cancelled') : 'Cancelled'; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="budget"><?= !empty($this->lang->line('label_budget')) ? $this->lang->line('label_budget') : 'Budget'; ?></label>
                                    <div class="input-group">
                                        <span class="input-group-addon bootstrap-touchspin-prefix input-group-prepend"><span class="input-group-text"><?= get_currency_symbol(); ?></span></span>
                                        <input class="form-control" type="number" min="0" id="budget" name="budget" value="0" placeholder="Project Budget">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="end_date"><?= !empty($this->lang->line('label_end_date')) ? $this->lang->line('label_end_date') : 'End Date'; ?></label>
                            <input class="form-control datepicker" type="text" id="end_date" name="end_date" value="" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="start_date"><?= !empty($this->lang->line('label_start_date')) ? $this->lang->line('label_start_date') : 'Start Date'; ?></label>
                            <input class="form-control datepicker" type="text" id="start_date" name="start_date" value="" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_description')) ? $this->lang->line('label_description') : 'Description'; ?></label>
                            <div class="input-group">
                                <textarea id="description" class="form-control" name="description"></textarea>
                            </div>
                        </div>
                    </div>
                    <?php if (!is_client()) { ?>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?= !empty($this->lang->line('label_select_users')) ? $this->lang->line('label_select_users') : 'Select Users'; ?></label>
                                <select class="form-control select2" multiple="" name="users[]" id="users">
                                    <?php foreach ($all_user as $all_users) {
                                        if (!is_client($all_users->id)) { ?>
                                            <option value="<?= $all_users->id ?>"><?= $all_users->first_name ?> <?= $all_users->last_name ?></option>
                                    <?php }
                                    } ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="clients"><?= !empty($this->lang->line('label_select_clients')) ? $this->lang->line('label_select_clients') : 'Select Clients'; ?></label>
                                <select id="clients" name="clients[]" class="form-control select2" multiple="">
                                    <?php foreach ($all_user as $all_users) {
                                        if (is_client($all_users->id)) { ?>
                                            <option value="<?= $all_users->id ?>"><?= $all_users->first_name ?> <?= $all_users->last_name ?></option>
                                    <?php }
                                    } ?>
                                </select>
                            </div>
                        </div>
                    <?php } ?>

                </div>
            </form>

            <form action="<?= base_url('projects/edit'); ?>" method="post" class="modal-part" id="modal-edit-project-part">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_title')) ? $this->lang->line('label_title') : 'Title'; ?></label>
                            <div class="input-group">
                                <input type="hidden" name="update_id" id="update_id">
                                <input type="text" class="form-control" placeholder="title" name="title" id="update_title">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_project_number')) ? $this->lang->line('label_project_number') : 'Project ID'; ?></label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="" name="project_number" id="update_project_number">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                            <div class="form-group">
                                <label for="section"><?= !empty($this->lang->line('label_section')) ? $this->lang->line('label_section') : 'Section'; ?></label>
                                <select name="section" class="form-control" id="update_section">
                                    <option value=""> --- </option>
                                    <option value="<?= !empty($this->lang->line('label_masawba')) ? $this->lang->line('label_masawba') : 'Masawba'; ?>"><?= !empty($this->lang->line('label_masawba')) ? $this->lang->line('label_masawba') : 'Masawba'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_hedayat')) ? $this->lang->line('label_hedayat') : 'Hedayat'; ?>"><?= !empty($this->lang->line('label_hedayat')) ? $this->lang->line('label_hedayat') : 'Hedayat'; ?></option>
                                </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                            <div class="form-group">
                                <label for="project_type"><?= !empty($this->lang->line('label_project_type')) ? $this->lang->line('label_project_type') : 'Project Type'; ?></label>
                                <select name="project_type" class="form-control" id="update_project_type">
                                    <option value=""> --- </option>
                                    <option value="<?= !empty($this->lang->line('label_general')) ? $this->lang->line('label_general') : 'General'; ?>"><?= !empty($this->lang->line('label_general')) ? $this->lang->line('label_general') : 'General'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_development')) ? $this->lang->line('label_development') : 'Development'; ?>"><?= !empty($this->lang->line('label_development')) ? $this->lang->line('label_development') : 'Development'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_construction')) ? $this->lang->line('label_construction') : 'Construction'; ?>"><?= !empty($this->lang->line('label_construction')) ? $this->lang->line('label_construction') : 'Construction'; ?></option>
                                    <option value="<?= !empty($this->lang->line('label_consultancy')) ? $this->lang->line('label_consultancy') : 'Consultancy'; ?>"><?= !empty($this->lang->line('label_consultancy')) ? $this->lang->line('label_consultancy') : 'Consultancy'; ?></option>
                                </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                            <div class="form-group">
                                <label for="meeting_lead"><?= !empty($this->lang->line('label_meeting_lead')) ? $this->lang->line('label_meeting_lead') : 'Ordered By'; ?></label>
                                <select name="meeting_lead" class="form-control" id="update_meeting_lead">
                                    
                                    <option value=""> --- </option>
                                    
                                    <option value="<?= !empty($this->lang->line('label_minister')) ? $this->lang->line('label_minister') : 'Minister'; ?>"><?= !empty($this->lang->line('label_minister')) ? $this->lang->line('label_minister') : 'Minister'; ?></option>
                                    
                                    <option value="President of The Islamic Republic of Afghanistan"><?= !empty($this->lang->line('label_president')) ? $this->lang->line('label_president') : 'President of The Islamic Republic of Afghanistan'; ?></option>
                                    
                                    <option value="Cabinet"><?= !empty($this->lang->line('label_cabinet')) ? $this->lang->line('label_cabinet') : 'Cabinet'; ?></option>
                                    
                                    <option value="Council of Ministers"><?= !empty($this->lang->line('label_council_of_ministers')) ? $this->lang->line('label_council_of_ministers') : 'The Council of Ministers'; ?></option>
                                    
                                    <option value="Supreme Council of the Rule of Law"><?= !empty($this->lang->line('label_supreme_council_of_the_law')) ? $this->lang->line('label_supreme_council_of_the_law') : 'Supreme Council of the Rule of Law'; ?></option>
                                    
                                    <option value="Supreme Economic Council"><?= !empty($this->lang->line('label_supreme_economic_council')) ? $this->lang->line('label_supreme_economic_council') : 'Supreme Economic Council'; ?></option>
                                    
                                    <option value="High Council of Regional Connection"><?= !empty($this->lang->line('label_high_council_of_regional_connection')) ? $this->lang->line('label_high_council_of_regional_connection') : 'High Council of Regional Connection'; ?></option>
                                    
                                    <option value="National Procurement Commission"><?= !empty($this->lang->line('label_national_procurement_commission')) ? $this->lang->line('label_national_procurement_commission') : 'National Procurement Commission'; ?></option>
                                    
                                    <option value="High Council of Infrastructure"><?= !empty($this->lang->line('label_high_council_of_infrastructure')) ? $this->lang->line('label_high_council_of_infrastructure') : 'High Council of Infrastructure'; ?></option>
                                    
                                    <option value="High Council for Poverty Reduction"><?= !empty($this->lang->line('label_high_council_for_poverty_reduction')) ? $this->lang->line('label_high_council_for_poverty_reduction') : 'High Council for Poverty Reduction'; ?></option>
                                    
                                    <option value="Scientific, Cultural and Human Resources Council, Office of Affairs"><?= !empty($this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs')) ? $this->lang->line('label_scientific_cultural_and_human_resources_council_office_of_affairs') : 'Scientific, Cultural and Human Resources Council, Office of Affairs'; ?></option>
                                    
                                    <option value="Directorate of National Security"><?= !empty($this->lang->line('label_directorate_of_national_security')) ? $this->lang->line('label_directorate_of_national_security') : 'Directorate of National Security'; ?></option>
                                    
                                    <option value="Ministry of Finance"><?= !empty($this->lang->line('label_ministry_of_finance')) ? $this->lang->line('label_ministry_of_finance') : 'Ministry of Finance'; ?></option>
                                    
                                    <option value="Ministry of Interior"><?= !empty($this->lang->line('label_ministry_of_interior')) ? $this->lang->line('label_ministry_of_interior') : 'Ministry of Interior'; ?></option>
                                    
                                    <option value="Ministry of Mines and Petroleum"><?= !empty($this->lang->line('label_ministry_of_mines_and_petroleum')) ? $this->lang->line('label_ministry_of_mines_and_petroleum') : 'Ministry of Mines and Petroleum'; ?></option>
                                    
                                    <option value="Ministry of Economy"><?= !empty($this->lang->line('label_ministry_of_economy')) ? $this->lang->line('label_ministry_of_economy') : 'Ministry of Economy'; ?></option>
                                    
                                    <option value="Ministry of Foreign Affairs"><?= !empty($this->lang->line('label_ministry_of_foreign_affairs')) ? $this->lang->line('label_ministry_of_foreign_affairs') : 'Ministry of Foreign Affairs'; ?></option>
                                    
                                    <option value="Ministry of Rural Rehabilitation and Development"><?= !empty($this->lang->line('label_ministry_of_rural_rehabilitation_and_development')) ? $this->lang->line('label_ministry_of_rural_rehabilitation_and_development') : 'Ministry of Rural Rehabilitation and Development'; ?></option>
                                    
                                    <option value="Ministry of Agriculture, Irrigation and Livestock"><?= !empty($this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock')) ? $this->lang->line('label_ministry_of_agriculture_irrigation_and_livestock') : 'Ministry of Agriculture, Irrigation and Livestock'; ?></option>
                                    
                                    <option value="Councilor of the Ministry of Finance"><?= !empty($this->lang->line('label_councilor_of_the_ministry_of_finance')) ? $this->lang->line('label_councilor_of_the_ministry_of_finance') : 'Councilor of the Ministry of Finance'; ?></option>
                                    
                                    <option value="Ministry of Urban Development and Housing"><?= !empty($this->lang->line('label_ministry_of_urban_development_and_housing')) ? $this->lang->line('label_ministry_of_urban_development_and_housing') : 'Ministry of Urban Development and Housing'; ?></option>
                                    
                                    <option value="Ministry of Commerce and Industry"><?= !empty($this->lang->line('label_ministry_of_commerce_and_industry')) ? $this->lang->line('label_ministry_of_commerce_and_industry') : 'Ministry of Commerce and Industry'; ?></option>
                                    
                                    <option value="Ministry of Justice"><?= !empty($this->lang->line('label_ministry_of_justice')) ? $this->lang->line('label_ministry_of_justice') : 'Ministry of Justice'; ?></option>
                                    
                                    <option value="Other"><?= !empty($this->lang->line('label_other')) ? $this->lang->line('label_other') : 'Other'; ?></option>
                                    
                                </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status"><?= !empty($this->lang->line('label_status')) ? $this->lang->line('label_status') : 'Status'; ?></label>
                                    <select name="status" class="form-control" id="update_status">
                                        <option value="notstarted"><?= !empty($this->lang->line('label_notstarted')) ? $this->lang->line('label_notstarted') : 'Not Started'; ?></option>
                                        <option value="ongoing"><?= !empty($this->lang->line('label_ongoing')) ? $this->lang->line('label_ongoing') : 'Ongoing'; ?></option>
                                        <option value="finished"><?= !empty($this->lang->line('label_finished')) ? $this->lang->line('label_finished') : 'Finished'; ?></option>
                                        <option value="onhold"><?= !empty($this->lang->line('label_onhold')) ? $this->lang->line('label_onhold') : 'OnHold'; ?></option>
                                        <option value="cancelled"><?= !empty($this->lang->line('label_cancelled')) ? $this->lang->line('label_cancelled') : 'Cancelled'; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="budget"><?= !empty($this->lang->line('label_budget')) ? $this->lang->line('label_budget') : 'Budget'; ?></label>
                                    <div class="input-group">
                                        <span class="input-group-addon bootstrap-touchspin-prefix input-group-prepend"><span class="input-group-text"><?= get_currency_symbol(); ?></span></span>
                                        <input class="form-control" type="number" min="0" id="update_budget" name="budget" value="0" placeholder="Project Budget">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="end_date"><?= !empty($this->lang->line('label_end_date')) ? $this->lang->line('label_end_date') : 'End Date'; ?></label>
                            <input class="form-control datepicker" type="text" id="update_end_date" name="end_date" value="2019-07-30" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="start_date"><?= !empty($this->lang->line('label_start_date')) ? $this->lang->line('label_start_date') : 'Start Date'; ?></label>
                            <input class="form-control datepicker" type="text" id="update_start_date" name="start_date" value="2019-07-24" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_description')) ? $this->lang->line('label_description') : 'Description'; ?></label>
                            <div class="input-group">
                                <textarea type="textarea" class="form-control" placeholder="description" name="description" id="update_description"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?= !empty($this->lang->line('label_select_users')) ? $this->lang->line('label_select_users') : 'Select Users'; ?> (Make Sure You Don't Remove Yourself From Project)</label>
                            <select class="form-control select2" multiple="" name="users[]" id="update_users">
                                <?php foreach ($all_user as $all_users) {
                                    if (!is_client($all_users->id)) { ?>
                                        <option value="<?= $all_users->id ?>"><?= $all_users->first_name ?> <?= $all_users->last_name ?></option>
                                <?php }
                                } ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="clients"><?= !empty($this->lang->line('label_select_clients')) ? $this->lang->line('label_select_clients') : 'Select Clients'; ?></label>
                            <select id="update_clients" name="clients[]" class="form-control select2" multiple="">
                                <?php foreach ($all_user as $all_users) {
                                    if (is_client($all_users->id)) { ?>
                                        <option value="<?= $all_users->id ?>"><?= $all_users->first_name ?> <?= $all_users->last_name ?></option>
                                <?php }
                                } ?>
                            </select>
                        </div>
                    </div>

                </div>
            </form>

            <?php include('include-footer.php'); ?>

        </div>
    </div>

    <?php include('include-js.php'); ?>

    <!-- Page Specific JS File -->

    <script src="<?= base_url('assets/js/page/components-user.js'); ?>"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        $('#description').summernote();
        });
    </script>
    <script>
        var description = document.getElementById('description'),
        output = document.getElementById('update_description');
        update_description.value = description.value.replace(/<(.|\n)*?>/, '').replace(/<\/(.|\n)*?>/, '');
    </script>
</body>

</html>