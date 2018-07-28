-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5174
-- --------------------------------------------------------

-- Dumping structure for table db_hospital_v260.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.language: ~414 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT IGNORE INTO `language` (`id`, `phrase`, `english`) VALUES
  (1, 'email', 'Email Address'),
  (2, 'password', 'Password'),
  (3, 'login', 'Log In'),
  (4, 'incorrect_email_password', 'Incorrect Email/Password!'),
  (5, 'user_role', 'User Role'),
  (6, 'please_login', 'Please Log In'),
  (7, 'setting', 'Setting'),
  (8, 'profile', 'Profile'),
  (9, 'logout', 'Log Out'),
  (10, 'please_try_again', 'Please Try Again'),
  (11, 'admin', 'Admin'),
  (12, 'doctor', 'Doctor'),
  (13, 'representative', 'Representative'),
  (14, 'dashboard', 'Dashboard'),
  (15, 'department', 'Department'),
  (16, 'add_department', 'Add Department'),
  (17, 'department_list', 'Department List'),
  (18, 'add_doctor', 'Add Doctor'),
  (19, 'doctor_list', 'Doctor List'),
  (20, 'add_representative', 'Add Representative'),
  (21, 'representative_list', 'Representative List'),
  (22, 'patient', 'Patient'),
  (23, 'add_patient', 'Add Patient'),
  (24, 'patient_list', 'Patient List'),
  (25, 'schedule', 'Schedule'),
  (26, 'add_schedule', 'Add Schedule'),
  (27, 'schedule_list', 'Schedule List'),
  (28, 'appointment', 'Appointment'),
  (29, 'add_appointment', 'Add Appointment'),
  (30, 'appointment_list', 'Appointment List'),
  (31, 'enquiry', 'Enquiry'),
  (32, 'language_setting', 'Language Setting'),
  (33, 'appointment_report', 'Appointment Report'),
  (34, 'assign_by_all', 'Assign by All'),
  (35, 'assign_by_doctor', 'Assign by Doctor'),
  (36, 'assign_to_doctor', 'Assign to Doctor'),
  (37, 'assign_by_representative', 'Assign by Representative'),
  (38, 'report', 'Report'),
  (39, 'assign_by_me', 'Assign by Me'),
  (40, 'assign_to_me', 'Assign to Me'),
  (41, 'website', 'Website'),
  (42, 'slider', 'Slider'),
  (43, 'section', 'Section'),
  (44, 'section_item', 'Section Item'),
  (45, 'comments', 'Comment'),
  (46, 'latest_enquiry', 'Latest Enquiry'),
  (47, 'total_progress', 'Total Progress'),
  (48, 'last_year_status', 'Showing status from the last year'),
  (49, 'department_name', 'Department Name'),
  (50, 'description', 'Description'),
  (51, 'status', 'Status'),
  (52, 'active', 'Active'),
  (53, 'inactive', 'Inactive'),
  (54, 'cancel', 'Cancel'),
  (55, 'save', 'Save'),
  (56, 'serial', 'SL.NO'),
  (57, 'action', 'Action'),
  (58, 'edit', 'Edit '),
  (59, 'delete', 'Delete'),
  (60, 'save_successfully', 'Save Successfully!'),
  (61, 'update_successfully', 'Update Successfully!'),
  (62, 'department_edit', 'Department Edit'),
  (63, 'delete_successfully', 'Delete successfully!'),
  (64, 'are_you_sure', 'Are You Sure ? '),
  (65, 'first_name', 'First Name'),
  (66, 'last_name', 'Last Name'),
  (67, 'phone', 'Phone No'),
  (68, 'mobile', 'Mobile No'),
  (69, 'blood_group', 'Blood Group'),
  (70, 'sex', 'Sex'),
  (71, 'date_of_birth', 'Date of Birth'),
  (72, 'address', 'Address'),
  (73, 'invalid_picture', 'Invalid Picture'),
  (74, 'doctor_profile', 'Doctor Profile'),
  (75, 'edit_profile', 'Edit Profile'),
  (76, 'edit_doctor', 'Edit Doctor'),
  (77, 'designation', 'Designation'),
  (78, 'short_biography', 'Short Biography'),
  (79, 'picture', 'Picture'),
  (80, 'specialist', 'Specialist'),
  (81, 'male', 'Male'),
  (82, 'female', 'Female'),
  (83, 'education_degree', 'Education/Degree'),
  (84, 'create_date', 'Create Date'),
  (85, 'view', 'View'),
  (86, 'doctor_information', 'Doctor Information'),
  (87, 'update_date', 'Update Date'),
  (88, 'print', 'Print'),
  (89, 'representative_edit', 'Representative Edit'),
  (90, 'patient_information', 'Patient Information'),
  (91, 'other', 'Other'),
  (92, 'patient_id', 'Patient ID'),
  (93, 'age', 'Age'),
  (94, 'patient_edit', 'Patient Edit'),
  (95, 'id_no', 'ID No.'),
  (96, 'select_option', 'Select Option'),
  (97, 'doctor_name', 'Doctor Name'),
  (98, 'day', 'Day'),
  (99, 'start_time', 'Start Time'),
  (100, 'end_time', 'End Time'),
  (101, 'per_patient_time', 'Per Patient Time'),
  (102, 'serial_visibility_type', 'Serial Visibility'),
  (103, 'sequential', 'Sequential'),
  (104, 'timestamp', 'Timestamp'),
  (105, 'available_days', 'Available Days'),
  (106, 'schedule_edit', 'Schedule Edit'),
  (107, 'available_time', 'Available Time'),
  (108, 'serial_no', 'Serial No'),
  (109, 'problem', 'Problem'),
  (110, 'appointment_date', 'Appointment Date'),
  (111, 'you_are_already_registered', 'You Are Already Registered'),
  (112, 'invalid_patient_id', 'Invalid patient ID'),
  (113, 'invalid_input', 'Invalid Input'),
  (114, 'no_doctor_available', 'No Doctor Available'),
  (115, 'invalid_department', 'Invalid Department!'),
  (116, 'no_schedule_available', 'No Schedule Available'),
  (117, 'please_fillup_all_required_fields', 'Please fillup all required filelds'),
  (118, 'appointment_id', 'Appointment ID'),
  (119, 'schedule_time', 'Schedule Time'),
  (120, 'appointment_information', 'Appointment Information'),
  (121, 'full_name', 'Full Name'),
  (122, 'read_unread', 'Read / Unread'),
  (123, 'date', 'Date'),
  (124, 'ip_address', 'IP Address'),
  (125, 'user_agent', 'User Agent'),
  (126, 'checked_by', 'Checked By'),
  (127, 'enquiry_date', 'Enquirey Date'),
  (128, 'enquiry_list', 'Enquiry List'),
  (129, 'filter', 'Filter'),
  (130, 'start_date', 'Start Date'),
  (131, 'end_date', 'End Date'),
  (132, 'application_title', 'Application Title'),
  (133, 'favicon', 'Favicon'),
  (134, 'logo', 'Logo'),
  (135, 'footer_text', 'Footer Text'),
  (136, 'language', 'Language'),
  (137, 'appointment_assign_by_all', 'Appointment Assign by All'),
  (138, 'appointment_assign_by_doctor', 'Appointment Assign by Doctor'),
  (139, 'appointment_assign_by_representative', 'Appointment Assign by Representative'),
  (140, 'appointment_assign_to_all_doctor', 'Appointment Assign to All Doctor'),
  (141, 'appointment_assign_to_me', 'Appointment Assign to Me'),
  (142, 'appointment_assign_by_me', 'Appointment Assign by Me'),
  (143, 'type', 'Type'),
  (144, 'website_title', 'Website Title'),
  (145, 'invalid_logo', 'Invalid Logo'),
  (146, 'details', 'Details'),
  (147, 'website_setting', 'Website Setting'),
  (148, 'submit_successfully', 'Submit Successfully!'),
  (149, 'application_setting', 'Application Setting'),
  (150, 'invalid_favicon', 'Invalid Favicon'),
  (151, 'new_enquiry', 'New Enquiry'),
  (152, 'information', 'Information'),
  (153, 'home', 'Home'),
  (154, 'select_department', 'Select Department'),
  (155, 'select_doctor', 'Select Doctor'),
  (156, 'select_representative', 'Select Representative'),
  (157, 'post_id', 'Post ID'),
  (158, 'thank_you_for_your_comment', 'Thank you for your comment!'),
  (159, 'comment_id', 'Comment ID'),
  (160, 'comment_status', 'Comment Status'),
  (161, 'comment_added_successfully', 'Comment Added Successfully'),
  (162, 'comment_remove_successfully', 'Comment Remove Successfully'),
  (163, 'select_item', 'Section Item'),
  (164, 'add_item', 'Add Item'),
  (165, 'menu_name', 'Menu Name'),
  (166, 'title', 'Title'),
  (167, 'position', 'Position'),
  (168, 'invalid_icon_image', 'Invalid Icon Image!'),
  (169, 'about', 'About'),
  (170, 'blog', 'Blog'),
  (171, 'service', 'Service'),
  (172, 'item_edit', 'Item Edit'),
  (173, 'registration_successfully', 'Registration Successfully'),
  (174, 'add_section', 'Add Section'),
  (175, 'section_name', 'Section Name'),
  (176, 'invalid_featured_image', 'Invalid Featured Image!'),
  (177, 'section_edit', 'Section Edit'),
  (178, 'meta_description', 'Meta Description'),
  (179, 'twitter_api', 'Twitter Api'),
  (180, 'google_map', 'Google Map'),
  (181, 'copyright_text', 'Copyright Text'),
  (182, 'facebook_url', 'Facebook URL'),
  (183, 'twitter_url', 'Twitter URL'),
  (184, 'vimeo_url', 'Vimeo URL'),
  (185, 'instagram_url', 'Instagram Url'),
  (186, 'dribbble_url', 'Dribbble URL'),
  (187, 'skype_url', 'Skype URL'),
  (188, 'add_slider', 'Add Slider'),
  (189, 'subtitle', 'Sub Title'),
  (190, 'slide_position', 'Slide Position'),
  (191, 'invalid_image', 'Invalid Image'),
  (192, 'image_is_required', 'Image is required'),
  (193, 'slider_edit', 'Slider Edit'),
  (194, 'meta_keyword', 'Meta Keyword'),
  (195, 'year', 'Year'),
  (196, 'month', 'Month'),
  (197, 'recent_post', 'Recent Post'),
  (198, 'leave_a_comment', 'Leave a Comment'),
  (199, 'submit', 'Submit'),
  (200, 'google_plus_url', 'Google Plus URL'),
  (201, 'website_status', 'Website Status'),
  (202, 'new_slide', 'New Slide'),
  (203, 'new_section', 'New Section'),
  (204, 'subtitle_description', 'Sub Title / Description'),
  (205, 'featured_image', 'Featured Image'),
  (206, 'new_item', 'New Item'),
  (207, 'item_position', 'Item Position'),
  (208, 'icon_image', 'Icon Image'),
  (209, 'post_title', 'Post Title'),
  (210, 'add_to_website', 'Add to Website'),
  (211, 'read_more', 'Read More'),
  (212, 'registration', 'Registration'),
  (213, 'appointment_form', 'Appointment Form'),
  (214, 'contact', 'Contact'),
  (215, 'optional', 'Optional'),
  (216, 'customer_comments', 'Customer Comments'),
  (217, 'need_a_doctor_for_checkup', 'Need a Doctor for Check-up?'),
  (218, 'just_make_an_appointment_and_you_are_done', 'JUST MAKE AN APPOINTMENT & YOU\'RE DONE ! '),
  (219, 'get_an_appointment', 'Get an appointment'),
  (220, 'latest_news', 'Latest News'),
  (221, 'latest_tweet', 'Latest Tweet'),
  (222, 'menu', 'Menu'),
  (223, 'select_user_role', 'Select User Role'),
  (224, 'site_align', 'Website Align'),
  (225, 'right_to_left', 'Right to Left'),
  (226, 'left_to_right', 'Left to Right'),
  (227, 'account_manager', 'Account Manager'),
  (228, 'add_invoice', 'Add Invoice'),
  (229, 'invoice_list', 'Invoice List'),
  (230, 'account_list', 'Account List'),
  (231, 'add_account', 'Add Account'),
  (232, 'account_name', 'Account Name'),
  (233, 'credit', 'Credit'),
  (234, 'debit', 'Debit'),
  (235, 'account_edit', 'Account Edit'),
  (236, 'quantity', 'Quantity'),
  (237, 'price', 'Price'),
  (238, 'total', 'Total'),
  (239, 'remove', 'Remove'),
  (240, 'add', 'Add'),
  (241, 'subtotal', 'Sub Total'),
  (242, 'vat', 'Vat'),
  (243, 'grand_total', 'Grand Total'),
  (244, 'discount', 'Discount'),
  (245, 'paid', 'Paid'),
  (246, 'due', 'Due'),
  (247, 'reset', 'Reset'),
  (248, 'add_or_remove', 'Add / Remove'),
  (249, 'invoice', 'Invoice'),
  (250, 'invoice_information', 'Invoice Information'),
  (251, 'invoice_edit', 'Invoice Edit'),
  (252, 'update', 'Update'),
  (253, 'all', 'All'),
  (254, 'patient_wise', 'Patient Wise'),
  (255, 'account_wise', 'Account Wise'),
  (256, 'debit_report', 'Debit Report'),
  (257, 'credit_report', 'Credit Report'),
  (258, 'payment_list', 'Payment List'),
  (259, 'add_payment', 'Add Payment'),
  (260, 'payment_edit', 'Payment Edit'),
  (261, 'pay_to', 'Pay To'),
  (262, 'amount', 'Amount'),
  (263, 'bed_type', 'Bed Type'),
  (264, 'bed_limit', 'Bed Capacity'),
  (265, 'charge', 'Charge'),
  (266, 'bed_list', 'Bed List'),
  (267, 'add_bed', 'Add Bed'),
  (268, 'bed_manager', 'Bed Manager'),
  (269, 'bed_edit', 'Bed Edit'),
  (270, 'bed_assign', 'Bed Assign'),
  (271, 'assign_date', 'Assign Date'),
  (272, 'discharge_date', 'Discharge Date'),
  (273, 'bed_assign_list', 'Bed Assign List'),
  (274, 'assign_by', 'Assign By'),
  (275, 'bed_available', 'Bed is Available'),
  (276, 'bed_not_available', 'Bed is Not Available'),
  (277, 'invlid_input', 'Invalid Input'),
  (278, 'allocated', 'Allocated'),
  (279, 'free_now', 'Free'),
  (280, 'select_only_avaiable_days', 'Select Only Avaiable Days'),
  (281, 'human_resources', 'Human Resources'),
  (282, 'nurse_list', 'Nurse List'),
  (283, 'add_employee', 'Add Employee'),
  (284, 'user_type', 'User Type'),
  (285, 'employee_information', 'Employee Information'),
  (286, 'employee_edit', 'Edit Employee'),
  (287, 'laboratorist_list', 'Laboratorist List'),
  (288, 'accountant_list', 'Accountant List'),
  (289, 'receptionist_list', 'Receptionist List'),
  (290, 'pharmacist_list', 'Pharmacist List'),
  (291, 'nurse', 'Nurse'),
  (292, 'laboratorist', 'Laboratorist'),
  (293, 'pharmacist', 'Pharmacist'),
  (294, 'accountant', 'Accountant'),
  (295, 'receptionist', 'Receptionist'),
  (296, 'noticeboard', 'Noticeboard'),
  (297, 'notice_list', 'Notice List'),
  (298, 'add_notice', 'Add Notice'),
  (299, 'hospital_activities', 'Hospital Activities'),
  (300, 'death_report', 'Death Report'),
  (301, 'add_death_report', 'Add Death Report'),
  (302, 'death_report_edit', 'Death Report Edit'),
  (303, 'birth_report', 'Birth Report'),
  (304, 'birth_report_edit', 'Birth Report Edit'),
  (305, 'add_birth_report', 'Add Birth Report'),
  (306, 'add_operation_report', 'Add Operation Report'),
  (307, 'operation_report', 'Operation Report'),
  (308, 'investigation_report', 'Investigation Report'),
  (309, 'add_investigation_report', 'Add Investigation Report'),
  (310, 'add_medicine_category', 'Add Medicine Category'),
  (311, 'medicine_category_list', 'Medicine Category List'),
  (312, 'category_name', 'Category Name'),
  (313, 'medicine_category_edit', 'Medicine Category Edit'),
  (314, 'add_medicine', 'Add Medicine'),
  (315, 'medicine_list', 'Medicine List'),
  (316, 'medicine_edit', 'Medicine Edit'),
  (317, 'manufactured_by', 'Manufactured By'),
  (318, 'medicine_name', 'Medicine Name'),
  (319, 'messages', 'Messages'),
  (320, 'inbox', 'Inbox'),
  (321, 'sent', 'Sent'),
  (322, 'new_message', 'New Message'),
  (323, 'sender', 'Sender Name'),
  (324, 'message', 'Message'),
  (325, 'subject', 'Subject'),
  (326, 'receiver_name', 'Send To'),
  (327, 'select_user', 'Select User'),
  (328, 'message_sent', 'Messages Sent'),
  (329, 'mail', 'Mail'),
  (330, 'send_mail', 'Send Mail'),
  (331, 'mail_setting', 'Mail Setting'),
  (332, 'protocol', 'Protocol'),
  (333, 'mailpath', 'Mail Path'),
  (334, 'mailtype', 'Mail Type'),
  (335, 'validate_email', 'Validate Email Address'),
  (336, 'true', 'True'),
  (337, 'false', 'False'),
  (338, 'attach_file', 'Attach File'),
  (339, 'wordwrap', 'Enable Word Wrap'),
  (340, 'send', 'Send'),
  (341, 'upload_successfully', 'Upload Successfully!'),
  (342, 'app_setting', 'App Setting'),
  (343, 'case_manager', 'Case Manager'),
  (344, 'patient_status', 'Patient Status'),
  (345, 'patient_status_edit', 'Edit Patient Status'),
  (346, 'add_patient_status', 'Add Patient Status'),
  (347, 'add_new_status', 'Add New Status'),
  (348, 'case_manager_list', 'Case Manager List'),
  (349, 'hospital_address', 'Hospital Address'),
  (350, 'ref_doctor_name', 'Ref. Doctor Name'),
  (351, 'hospital_name', 'Hospital Name'),
  (352, 'patient_name', 'Patient  Name'),
  (353, 'document_list', 'Document List'),
  (354, 'add_document', 'Add Document'),
  (355, 'upload_by', 'Upload By'),
  (356, 'documents', 'Documents'),
  (357, 'prescription', 'Prescription'),
  (358, 'add_prescription', 'Add Prescription'),
  (359, 'prescription_list', 'Prescription List'),
  (360, 'add_insurance', 'Add Insurance'),
  (361, 'insurance_list', 'Insurance List'),
  (362, 'insurance_name', 'Insurance Name'),
  (366, 'add_patient_case_study', 'Add Patient Case Study'),
  (367, 'patient_case_study_list', 'Patient Case Study List'),
  (368, 'food_allergies', 'Food Allergies'),
  (369, 'tendency_bleed', 'Tendency Bleed'),
  (370, 'heart_disease', 'Heart Disease'),
  (371, 'high_blood_pressure', 'High Blood Pressure'),
  (372, 'diabetic', 'Diabetic'),
  (373, 'surgery', 'Surgery'),
  (374, 'accident', 'Accident'),
  (375, 'others', 'Others'),
  (376, 'family_medical_history', 'Family Medical History'),
  (377, 'current_medication', 'Current Medication'),
  (378, 'female_pregnancy', 'Female Pregnancy'),
  (379, 'breast_feeding', 'Breast Feeding'),
  (380, 'health_insurance', 'Health Insurance'),
  (381, 'low_income', 'Low Income'),
  (382, 'reference', 'Reference'),
  (385, 'instruction', 'Instruction'),
  (386, 'medicine_type', 'Medicine Type'),
  (387, 'days', 'Days'),
  (388, 'weight', 'Weight'),
  (389, 'blood_pressure', 'Blood Pressure'),
  (390, 'old', 'Old'),
  (391, 'new', 'New'),
  (392, 'case_study', 'Case Study'),
  (393, 'chief_complain', 'Chief Complain'),
  (394, 'patient_notes', 'Patient Notes'),
  (395, 'visiting_fees', 'Visiting Fees'),
  (396, 'diagnosis', 'Diagnosis'),
  (397, 'prescription_id', 'Prescription ID'),
  (398, 'name', 'Name'),
  (399, 'prescription_information', 'Prescription Information'),
  (400, 'sms', 'SMS'),
  (401, 'gateway_setting', 'Gateway Setting'),
  (402, 'time_zone', 'Time Zone'),
  (403, 'username', 'User Name'),
  (404, 'provider', 'Provider'),
  (405, 'sms_template', 'SMS Template'),
  (406, 'template_name', 'Template Name'),
  (407, 'sms_schedule', 'SMS Schedule'),
  (408, 'schedule_name', 'Schedule Name'),
  (409, 'time', 'Time'),
  (410, 'already_exists', 'Already Exists'),
  (411, 'send_custom_sms', 'Send Custom SMS'),
  (412, 'sms_sent', 'SMS Sent!'),
  (413, 'custom_sms_list', 'Custom SMS List'),
  (414, 'reciver', 'Reciver'),
  (415, 'auto_sms_report', 'Auto SMS Report'),
  (417, 'user_sms_list', 'User SMS List'),
  (418, 'send_sms', 'Send SMS'),
  (419, 'new_sms', 'New SMS'),
  (420, 'sms_list', 'SMS List'),
  (421, 'insurance', 'Insurance'),
  (422, 'add_limit_approval', 'Add Limit Approval'),
  (423, 'limit_approval_list', 'Limit Approval List'),
  (424, 'service_tax', 'Service Tax'),
  (425, 'remark', 'Remark'),
  (426, 'insurance_no', 'Insurance No.'),
  (427, 'insurance_code', 'Insurance Code'),
  (428, 'hospital_rate', 'Hospital Rate'),
  (429, 'insurance_rate', 'Insurance Rate'),
  (430, 'disease_charge', 'Disease Charge'),
  (431, 'disease_name', 'Disease Name'),
  (432, 'room_no', 'Room No'),
  (433, 'disease_details', 'Disease Details'),
  (434, 'consultant_name', 'Consultant Name'),
  (435, 'policy_name', 'Policy Name'),
  (436, 'policy_no', 'Policy No.'),
  (437, 'policy_holder_name', 'Policy Holder Name'),
  (438, 'approval_breakup', ' Approval Charge Break up'),
  (439, 'limit_approval', 'Limit Approval'),
  (440, 'insurance_limit_approval', 'Insurance Limit Approval'),
  (441, 'billing', 'Billing'),
  (442, 'add_admission', 'Add Patient Admission'),
  (443, 'add_service', 'Add Service'),
  (444, 'service_list', 'Service List'),
  (445, 'service_name', 'Service Name'),
  (446, 'add_package', 'Add Package'),
  (447, 'package_list', 'Package List'),
  (448, 'package_name', 'Package Name'),
  (449, 'package_details', 'Package Details'),
  (450, 'edit_package', 'Edit Package'),
  (451, 'admission_date', 'Admission Date'),
  (452, 'guardian_name', 'Guardian Name'),
  (453, 'agent_name', 'Agent Name'),
  (454, 'guardian_relation', 'Guardian Relation'),
  (455, 'guardian_contact', 'Guardian Contact'),
  (456, 'guardian_address', 'Guardian Address'),
  (457, 'admission_list', 'Patient Admission List'),
  (458, 'admission_id', 'AID'),
  (459, 'edit_admission', 'Edit Admission'),
  (460, 'add_advance', 'Add Advance Payment'),
  (461, 'advance_list', 'Advance Payment List'),
  (462, 'receipt_no', 'Receipt No'),
  (463, 'cash_card_or_cheque', 'Cash / Card / Cheque'),
  (464, 'payment_method', 'Payment Method'),
  (465, 'add_bill', 'Add Bill'),
  (466, 'bill_list', 'Bill List'),
  (467, 'bill_date', 'Bill Date'),
  (468, 'total_days', 'Total Days'),
  (469, 'advance_payment', 'Advance Payment'),
  (470, 'cash', 'Cash'),
  (471, 'card', 'Card'),
  (472, 'cheque', 'Cheque'),
  (473, 'card_cheque_no', 'Card / Cheque No.'),
  (474, 'receipt', 'Receipt'),
  (475, 'tax', 'Tax'),
  (476, 'pay_advance', 'Pay Advance'),
  (477, 'payable', 'Payable'),
  (478, 'notes', 'Notes'),
  (479, 'rate', 'Rate'),
  (480, 'bill_id', 'Bill ID.'),
  (481, 'paid', 'Paid'),
  (482, 'unpaid', 'Unpaid'),
  (483, 'bill_details', 'Bill Details'),
  (484, 'signature', 'Signature'),
  (485, 'update_bill', 'Update Bill');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_setting
DROP TABLE IF EXISTS `ws_setting`;
CREATE TABLE IF NOT EXISTS `ws_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `twitter_api` text,
  `google_map` text,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `vimeo` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `dribbble` varchar(100) DEFAULT NULL,
  `skype` varchar(100) DEFAULT NULL,
  `google_plus` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `ws_setting` DISABLE KEYS */;
INSERT IGNORE INTO `ws_setting` (`id`, `title`, `description`, `logo`, `favicon`, `meta_tag`, `meta_keyword`, `email`, `phone`, `address`, `copyright_text`, `twitter_api`, `google_map`, `facebook`, `twitter`, `vimeo`, `instagram`, `dribbble`, `skype`, `google_plus`, `status`) VALUES
  (1, 'Bdtask Hospital Limited', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '', '', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. ', '               Hospital, Appointment, System, \r\nHospital Appointment,Demo, Appointment', 'demo@hospital.com', '0123456788', '123/A, Street, State-12345, Demo', '<p>&copy; 2016 <a title="BdTask" href="http://bdtask.com" target="_blank">bdtask</a>. All rights reserved</p>\r\n<p>&nbsp;</p>', '<a class="twitter-timeline" data-lang="en" data-dnt="true" data-link-color="#207FDD" href="https://twitter.com/taylorswift13">Tweets by taylorswift13</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29215.021939977993!2d90.40923229999999!3d23.75173875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sbn!2sbd!4v1477987829881" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', 'http://facebook.com/', 'http://', 'http://', 'http://', 'http://', 'http://', 'http://', 1);
/*!40000 ALTER TABLE `ws_setting` ENABLE KEYS */;



-- Dumping structure for table db_hospital_v260.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT IGNORE INTO `setting` (`setting_id`, `title`, `description`, `email`, `phone`, `logo`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`) VALUES
  (2, 'Demo Hospital Limited', '98 Green Road, Farmgate, Dhaka-1215', 'bdtask@gmail.com', '1922296392', 'assets/images/apps/90908412f7fdadd81a40a3f79e9c3d52.png', 'assets/images/icons/a0ed8ec88e07205e07116f9098844bb8.ico', 'english', 'LTR', '2017©Copyright', 'Asia/Dhaka');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;


DROP TABLE IF EXISTS `acm_account`;
CREATE TABLE IF NOT EXISTS `acm_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table db_hospital_v260.acm_invoice
DROP TABLE IF EXISTS `acm_invoice`;
CREATE TABLE IF NOT EXISTS `acm_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) NOT NULL,
  `total` float NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  `grand_total` float NOT NULL,
  `paid` float NOT NULL,
  `due` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table db_hospital_v260.acm_invoice_details
DROP TABLE IF EXISTS `acm_invoice_details`;
CREATE TABLE IF NOT EXISTS `acm_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `subtotal` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_invoice_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `acm_invoice_details` DISABLE KEYS */;
INSERT IGNORE INTO `acm_invoice_details` (`id`, `invoice_id`, `account_id`, `description`, `quantity`, `price`, `subtotal`) VALUES
  (70, 14, 8, 'Visit', 1, 50, 50),
  (71, 15, 8, 'Doctor visit fee', 1, 500, 500),
  (73, 16, 8, 'This is demo doctor', 3, 600, 1800),
  (74, 17, 8, 'Doctor Visit', 1, 5000, 5000),
  (75, 17, 9, 'Bed Fee', 1, 4000, 4000);
/*!40000 ALTER TABLE `acm_invoice_details` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.acm_payment
DROP TABLE IF EXISTS `acm_payment`;
CREATE TABLE IF NOT EXISTS `acm_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `pay_to` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `created_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.acm_payment: ~5 rows (approximately)
/*!40000 ALTER TABLE `acm_payment` DISABLE KEYS */;
INSERT IGNORE INTO `acm_payment` (`id`, `account_id`, `pay_to`, `description`, `amount`, `created_id`, `date`, `status`) VALUES
  (8, 10, 'Alamin', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 2, '2017-01-16', 1),
  (9, 11, 'Tanzil', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor', 400, 2, '2017-01-16', 1),
  (10, 10, 'Jon Dye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 200, 27, '2017-01-17', 1),
  (11, 10, 'Kanye', 'This is demo doctor This is demo doctor This is demo doctor This is demo doctor ', 500, 27, '2017-01-16', 1),
  (12, 11, 'MR. RAHIM', '', 10000, 27, '2017-02-27', 1);
/*!40000 ALTER TABLE `acm_payment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.appointment
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.appointment: ~25 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT IGNORE INTO `appointment` (`id`, `appointment_id`, `patient_id`, `department_id`, `doctor_id`, `schedule_id`, `serial_no`, `date`, `problem`, `created_by`, `create_date`, `status`) VALUES
  (74, 'AERIUIM1', 'PL8XEPGJ', 15, 15, 21, 1, '2017-01-13', 'Hi ! I have matha betha Problem', 1, '2017-01-12', 1),
  (75, 'AU6167SP', 'P3GWY7V3', 15, 15, 21, 2, '2017-01-13', 'Hi ! Sir I have Mathabetha problem', 8, '2017-01-12', 1),
  (76, 'ASAXBOMC', 'PMXZFDP9', 24, 1, 22, 29, '2017-01-14', 'Hi! hello how are', 2, '2017-01-12', 1),
  (77, 'AZO0W67W', 'PL8XEPGJ', 15, 15, 21, 3, '2017-01-20', 'Pain ', 8, '2017-01-15', 1),
  (78, 'ALEMBJQL', 'P79I35Q5', 12, 12, 19, 1, '2017-01-22', '', 7, '2017-01-16', 1),
  (79, 'AL4WVCVD', 'PPPZJP52', 12, 1, 24, 1, '2017-01-18', 'TE$ST', 7, '2017-01-16', 1),
  (80, 'AZ0YMNYW', 'PNR6B7EY', 15, 1, 21, 1, '2017-10-18', 'Hi ! I am in problem', 8, '2017-01-16', 1),
  (81, 'AMUYVE7L', 'PR5JXID6', 18, 1, 25, 2, '2017-01-16', 'He sir How are you', 2, '2017-01-16', 1),
  (84, 'AK6VLKQ1', 'PYRT7ZOS', 12, 1, 24, 2, '2017-01-18', 'Test', 1, '2017-01-16', 1),
  (85, 'ARUMVG9X', 'P43O0999', 12, 12, 19, 1, '2017-03-05', 'TEST', 0, '2017-02-28', 1),
  (97, 'ATJPS3QD', 'PWBQ2LIR', 12, 1, 26, 1, '2017-10-08', 'TEST', 2, '2017-10-03', 1),
  (98, 'AOV0EX6V', 'P43O0999', 12, 1, 26, 2, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
  (99, 'AG7QSRVG', 'P3GWY7V3', 12, 12, 24, 1, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
  (100, 'A3NYEKF2', 'PL8XEPGJ', 12, 1, 20, 1, '2017-10-06', 'TEST', 1, '2017-10-03', 1),
  (101, 'ADZ5XSNT', 'PL8XEPGJ', 12, 1, 26, 3, '2017-10-08', 'TEST', 1, '2017-10-03', 1),
  (102, 'A69YI1XW', 'PR5JXID6', 12, 12, 24, 2, '2017-10-04', 'TEST', 1, '2017-10-03', 1),
  (103, 'AWZQ25KR', 'P4SKM8O6', 12, 12, 24, 3, '2017-10-04', 'TEST', 7, '2017-10-03', 1),
  (104, 'AO31WUAH', 'PC7XX3B8', 12, 1, 26, 4, '2017-10-08', 'TEST', 0, '2017-10-03', 1),
  (105, 'AYY5DUC7', 'P73FYR4H', 12, 1, 20, 2, '2017-10-06', 'TEST', 0, '2017-10-05', 1),
  (106, 'ABIC772V', 'PY6K4ZNF', 12, 1, 20, 3, '2017-10-06', 'test', 0, '2017-10-05', 1),
  (114, 'A3TC768W', 'PY6K4ZNF', 12, 1, 20, 1, '2017-10-13', '', 0, '2017-10-07', 1),
  (115, 'ASEVGS1F', 'PXVA8KUS', 12, 12, 24, 1, '2017-10-11', 'TEST', 1, '2017-10-08', 1),
  (116, 'AWWSI9NP', 'P3NMSGOR', 12, 1, 27, 1, '2017-10-09', 'Test', 7, '2017-10-08', 1),
  (117, 'AFNMKYYN', 'PLCWTP8G', 12, 1, 27, 2, '2017-10-09', '', 8, '2017-10-08', 1),
  (118, 'A170KPPP', 'PV53V0HJ', 12, 1, 20, 2, '2017-10-13', 'Test Problem', 0, '2017-10-10', 1),
  (119, 'APG978ZK', 'PHGWD0W0', 18, 16, 25, 1, '2017-12-11', '', 0, '2017-12-11', 1),
  (120, 'ACV6WK7Y', 'P9XA38LW', 12, 1, 27, 1, '2017-12-18', '', 0, '2017-12-14', 1);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.bill_admission
DROP TABLE IF EXISTS `bill_admission`;
CREATE TABLE IF NOT EXISTS `bill_admission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_relation` varchar(255) DEFAULT NULL,
  `guardian_contact` varchar(255) DEFAULT NULL,
  `guardian_address` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`), 
  UNIQUE KEY `Index 2` (`admission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.bill_advanced
DROP TABLE IF EXISTS `bill_advanced`;
CREATE TABLE IF NOT EXISTS `bill_advanced` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admission_id` varchar(20) DEFAULT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `amount` float DEFAULT '0',
  `payment_method` varchar(255) DEFAULT NULL,
  `cash_card_or_cheque` varchar(10) DEFAULT NULL COMMENT '1 cash, 2 card, 3 cheque',
  `receipt_no` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ipd_bill_advanced_ipd_admission` (`admission_id`),
  CONSTRAINT `FK_ipd_bill_advanced_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

-- Dumping structure for table db_hospital_v260.bill_package
DROP TABLE IF EXISTS `bill_package`;
CREATE TABLE IF NOT EXISTS `bill_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `services` text,
  `discount` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.bill_service
DROP TABLE IF EXISTS `bill_service`;
CREATE TABLE IF NOT EXISTS `bill_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

-- Dumping structure for table db_hospital_v260.bill
DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(20) DEFAULT NULL,
  `bill_type` varchar(20) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `discount` float DEFAULT '0',
  `tax` float DEFAULT '0',
  `total` float DEFAULT '0',
  `payment_method` varchar(10) DEFAULT NULL,
  `card_cheque_no` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(100) DEFAULT NULL,
  `note` text,
  `date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`bill_id`),
  KEY `Index 2` (`admission_id`),
  CONSTRAINT `FK_ipd_bill_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

-- Dumping structure for table db_hospital_v260.bm_bed
DROP TABLE IF EXISTS `bm_bed`;
CREATE TABLE IF NOT EXISTS `bm_bed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `limit` int(3) NOT NULL,
  `charge` float NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.bill_details
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE IF NOT EXISTS `bill_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(20) DEFAULT NULL,
  `admission_id` varchar(20) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Key As Bill_ID` (`bill_id`),
  KEY `Admission ID` (`admission_id`),
  CONSTRAINT `fk_ipd_bill_details_ipd_admission` FOREIGN KEY (`admission_id`) REFERENCES `bill_admission` (`admission_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ipd_bill_details_ipd_bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 


-- Dumping structure for table db_hospital_v260.bm_bed_assign
DROP TABLE IF EXISTS `bm_bed_assign`;
CREATE TABLE IF NOT EXISTS `bm_bed_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(20) DEFAULT NULL,
  `patient_id` varchar(20) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `assign_date` date NOT NULL,
  `discharge_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.cm_patient
DROP TABLE IF EXISTS `cm_patient`;
CREATE TABLE IF NOT EXISTS `cm_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) NOT NULL,
  `case_manager_id` int(11) NOT NULL,
  `ref_doctor_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_address` text,
  `doctor_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.cm_status
DROP TABLE IF EXISTS `cm_status`;
CREATE TABLE IF NOT EXISTS `cm_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `critical_status` varchar(255) NOT NULL DEFAULT '1',
  `cm_patient_id` int(11) NOT NULL,
  `description` text,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.custom_sms_info
DROP TABLE IF EXISTS `custom_sms_info`;
CREATE TABLE IF NOT EXISTS `custom_sms_info` (
  `custom_sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `reciver` varchar(100) NOT NULL,
  `gateway` text NOT NULL,
  `message` text NOT NULL,
  `sms_date_time` datetime NOT NULL,
  PRIMARY KEY (`custom_sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dprt_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dprt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.department: ~12 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT IGNORE INTO `department` (`dprt_id`, `name`, `description`, `status`) VALUES
  (12, 'Microbiology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (13, 'Neonatal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (14, 'Nephrology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (15, 'Neurology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (16, 'Oncology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (17, 'Orthopaedics', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (18, 'Pharmacy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (19, 'Radiotherapy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (21, 'Rheumatology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (22, 'Gynaecology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (23, 'Obstetrics', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\n\r\n', 1),
  (25, 'General Surgery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula.', 1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `description` text,
  `hidden_attach_file` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `upload_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.enquiry
DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE IF NOT EXISTS `enquiry` (
  `enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `enquiry` text,
  `checked` tinyint(1) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`enquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.enquiry: ~9 rows (approximately)
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT IGNORE INTO `enquiry` (`enquiry_id`, `email`, `phone`, `name`, `enquiry`, `checked`, `ip_address`, `user_agent`, `checked_by`, `created_date`, `status`) VALUES
  (56, 'tanzil4091@gmail.com', '1922296392', 'Tanzil Ahmad', 'Hi ! I want to add your Hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 2, '2017-01-16 05:29:20', 1),
  (57, 'sumch@gmail.com', '1922296398', 'Tarek', 'Hi ! I want to work with hospital', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:30:05', 1),
  (58, 'jon@gmail.com', '1782296392', 'Jon Doy', 'Hi ! How are you. i want to work with demo hospital limited.', 1, '103.225.228.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', 7, '2017-01-16 05:31:15', 1),
  (59, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 09:32:46', 0),
  (60, 'john@doe.com', '01255564757845', 'John Doe', '<p>HELLO</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 7, '2017-02-26 09:34:20', 0),
  (62, 'john@doe.com', '01312323456', 'John Doe', '<p>Hello World!</p>\r\n<p>Ã‚Â </p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-26 11:25:20', 1),
  (63, 'receptionist@demo.com', '0123456789', 'Test', '<p>HELLO ADMIN!</p>', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 09:06:10', 1),
  (64, 'test@demo.com', '0123456789', 'Test', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-27 10:32:02', 1),
  (65, 'swift@example.com', '1234567890', 'Swift', 'Need a Doctor for Check-up?\r\nJUST MAKE AN APPOINTMENT & YOU\'RE DONE !', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 2, '2017-02-28 11:39:52', 1);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ha_birth
DROP TABLE IF EXISTS `ha_birth`;
CREATE TABLE IF NOT EXISTS `ha_birth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.ha_category
DROP TABLE IF EXISTS `ha_category`;
CREATE TABLE IF NOT EXISTS `ha_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.ha_death
DROP TABLE IF EXISTS `ha_death`;
CREATE TABLE IF NOT EXISTS `ha_death` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.ha_investigation
DROP TABLE IF EXISTS `ha_investigation`;
CREATE TABLE IF NOT EXISTS `ha_investigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.ha_medicine
DROP TABLE IF EXISTS `ha_medicine`;
CREATE TABLE IF NOT EXISTS `ha_medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `manufactured_by` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.ha_operation
DROP TABLE IF EXISTS `ha_operation`;
CREATE TABLE IF NOT EXISTS `ha_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.inc_insurance
DROP TABLE IF EXISTS `inc_insurance`;
CREATE TABLE IF NOT EXISTS `inc_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_name` varchar(255) DEFAULT NULL,
  `service_tax` varchar(50) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `remark` text,
  `insurance_no` varchar(50) DEFAULT NULL,
  `insurance_code` varchar(50) DEFAULT NULL,
  `disease_charge` text COMMENT 'array(name, charge)',
  `hospital_rate` varchar(50) DEFAULT NULL,
  `insurance_rate` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.inc_limit_approval
DROP TABLE IF EXISTS `inc_limit_approval`;
CREATE TABLE IF NOT EXISTS `inc_limit_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `disease_details` text COMMENT 'name, description',
  `consultant_id` int(11) DEFAULT NULL COMMENT 'doctor list',
  `policy_name` varchar(255) DEFAULT NULL,
  `policy_no` varchar(100) DEFAULT NULL,
  `policy_holder_name` varchar(255) DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `approval_breakup` text COMMENT 'name, charge',
  `total` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.mail_setting
DROP TABLE IF EXISTS `mail_setting`;
CREATE TABLE IF NOT EXISTS `mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(20) NOT NULL,
  `mailpath` varchar(255) NOT NULL,
  `mailtype` varchar(20) NOT NULL,
  `validate_email` varchar(20) NOT NULL,
  `wordwrap` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.mail_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `mail_setting` DISABLE KEYS */;
INSERT IGNORE INTO `mail_setting` (`id`, `protocol`, `mailpath`, `mailtype`, `validate_email`, `wordwrap`) VALUES
  (5, 'sendmail', '/usr/sbin/sendmail', 'html', 'false', 'true');
/*!40000 ALTER TABLE `mail_setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.message
DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.notice
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `assign_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.patient
DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `affliate` varchar(50) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.patient: ~34 rows (approximately)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT IGNORE INTO `patient` (`id`, `patient_id`, `firstname`, `lastname`, `email`, `password`, `phone`, `mobile`, `address`, `sex`, `blood_group`, `date_of_birth`, `affliate`, `picture`, `created_by`, `create_date`, `status`) VALUES
  (26, 'PHR2DQW0', 'Jajia Jannat ', 'Rahi', NULL, NULL, '0182222221111', '01911112223333', '301,bti central plaza', 'Male', 'A+', '2000-01-01', NULL, 'assets/images/patient/2017-01-16/p11.png', 2, '2017-01-12', 1),
  (27, 'P1RNKS9W', 'Jane ', 'Doe', NULL, NULL, '017344444111', '8801821742285', 'South Ferri Ghat,Padma River,Chandpur', 'Male', 'A+', '1999-01-01', NULL, 'assets/images/patient/2017-01-16/p10.png', 2, '2017-01-12', 1),
  (28, 'PMXZFDP9', 'Himik ', 'Andlazuna', NULL, NULL, '0182222221111', '01911112223333', 'jr,Road,Complex cirt', 'Male', 'A-', '1991-05-23', NULL, 'assets/images/patient/2017-01-16/p9.png', 2, '2017-01-12', 1),
  (29, 'P3GWY7V3', 'Znakng ', 'Xinaktar', NULL, NULL, '01711111122', '018111111111111', '231,East Patalipur,Sonamuri', 'Male', 'B+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p8.png', 2, '2017-01-12', 1),
  (30, 'PA0I54ZM', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'O+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p7.png', 2, '2017-01-12', 1),
  (31, 'PL8XEPGJ', 'Amer', 'Ahmedullah ', NULL, NULL, '017222222222', '01922296392', '231,East Patalipur,Sonamuri', 'Male', 'B+', '1970-01-01', NULL, 'assets/images/patient/2017-01-16/p6.png', 2, '2017-01-12', 1),
  (32, 'P79I35Q5', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B+', '1980-02-03', NULL, 'assets/images/patient/2017-01-16/p4.png', 2, '2017-01-15', 1),
  (33, 'PT5L36X1', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', '', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p3.png', 2, '2017-01-16', 1),
  (34, 'PR5JXID6', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', '', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p2.png', 2, '2017-01-16', 1),
  (35, 'PPPZJP52', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'A-', '0000-00-00', NULL, 'assets/images/patient/2017-01-16/p1.png', 2, '2017-01-16', 1),
  (36, 'PNR6B7EY', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B+', '1969-12-31', NULL, 'assets/images/patient/2017-01-16/p.png', 1, '2017-01-16', 1),
  (37, 'PYRT7ZOS', 'Tanzil', 'Ahmad', NULL, NULL, '1922296392', '1922296392', '98 Green Road, Farmgate, Dhaka-1215', 'Male', 'B-', '1969-12-31', NULL, 'assets/images/patient/2017-01-16/p5.png', 1, '2017-01-16', 1),
  (38, 'PZZWZDVA', 'Tuhin', 'Sorkar', NULL, NULL, '', '0123456789', 'Hello', 'Male', '', '2017-02-26', NULL, '', 26, '2017-02-26', 1),
  (39, 'P43O0999', 'Sahed', 'Abdullah', NULL, NULL, '', '0123456789', 'TEST', 'Male', 'A+', '2017-04-02', NULL, NULL, NULL, '2017-02-28', 1),
  (40, 'P1XWEV6W', 'Alex', 'Anderson', 'patient@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '02123456789', 'Kathal Bagan, Dhaka', 'Male', NULL, '1970-01-01', NULL, 'assets/images/patient/2017-03-02/i.jpg', 40, '2017-03-02', 1),
  (41, 'P72P7031', 'Tuhin', 'Sorkar', NULL, NULL, '012346578955', '01324658585585', 'TEST', 'Male', 'O+', '2017-04-20', NULL, '', 1, '2017-04-20', 1),
  (42, 'P45KRFCA', 'Jahed', 'Abdullah', 'jahed@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '0123456789', '0123456788', 'Dhaka, Bangladesh', 'Male', 'B+', '1997-04-20', NULL, 'assets/images/patient/2017-04-20/i.jpg', 2, '2017-04-20', 1),
  (43, 'PJ3URDGO', 'kamal', 'uddin', 'kamal@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '1234567890', 'TEST', 'Male', 'B+', '2017-04-24', NULL, '', 1, '2017-04-24', 1),
  (44, 'PWBQ2LIR', 'Jane', 'Doe', NULL, NULL, '', '018217842552', 'test, street, NY', 'Female', 'B+', '0000-00-00', NULL, 'assets/images/patient/2017-07-03/d1.jpg', 1, '2017-07-03', 1),
  (45, 'PC2YMXFN', 'Jahed', 'Abdullah', 'jahed@example.com', '25d55ad283aa400af464c76d713c07ad', '02145', '01821742285', 'Dhaka', 'Male', 'O-', '1995-10-03', NULL, '', 2, '2017-10-03', 1),
  (46, 'P8U5B5VR', 'Jane ', 'Doe', 'jane@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'TEST', 'Male', 'O-', '1997-10-03', NULL, '', 1, '2017-10-03', 1),
  (47, 'P4SKM8O6', 'Jony', 'Alam', 'jony@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'TEST', 'Male', 'B+', '1997-10-03', NULL, '', 7, '2017-10-03', 1),
  (48, 'PC7XX3B8', 'Kawsar', 'Jahan', NULL, NULL, '0123456789', '01821742285', 'TEST', 'Male', 'O+', '2000-10-02', NULL, NULL, NULL, '2017-10-03', 1),
  (49, 'P7Q6SFYR', 'Jahed', 'Alam', NULL, NULL, '0123456789', '01821742285', 'TEST', 'Male', 'B+', '2017-10-10', NULL, NULL, NULL, '2017-10-03', 1),
  (50, 'PY0ICCOL', 'Jahir', 'Khan', 'jahir@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '01821742285', 'Dhaka', 'Male', 'B+', '1994-10-02', NULL, '', 2, '2017-10-04', 1),
  (51, 'P73FYR4H', 'Ashif', 'Islam', NULL, NULL, '0123456789', '0123456789', 'EST', 'Male', 'A+', '2017-10-05', NULL, NULL, 2, '2017-10-05', 1),
  (52, 'PY6K4ZNF', 'Kamal', 'Uddin', NULL, NULL, '0123456789', '0123456789', 'Test', 'Male', 'O+', '2017-10-05', NULL, NULL, 2, '2017-10-05', 1),
  (57, 'PIBQOWSP', 'Jahed', 'Abduallah', 'jahed1@example.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '0123456789', 'Dhaka', 'Male', 'B+', '1997-10-07', NULL, '', 2, '2017-10-07', 1),
  (58, 'PH11SH74', 'Jahed', 'Abduallah', 'jahed2@example.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '0123456789', 'Dhaka, Bangladesh', 'Male', 'O+', '1995-10-07', NULL, '', 2, '2017-10-07', 1),
  (59, 'PJ447J2Z', 'Jahed', 'Abduallah', NULL, NULL, '', '0123456789', 'TEST', 'Male', 'B+', '2017-10-06', NULL, NULL, NULL, '2017-10-07', 1),
  (60, 'PXVA8KUS', 'John', 'Doe', 'john@example.com', 'fcea920f7412b5da7be0cf42b8c93759', '', '0123456789', 'Test', 'Male', 'B+', '2017-10-01', NULL, '', 1, '2017-10-08', 1),
  (61, 'P3NMSGOR', 'Jennifer', 'Smith', 'jennifer@example.com', 'e10adc3949ba59abbe56e057f20f883e', '', '0123456789', 'NY, USA', 'Male', 'B+', '2017-10-08', NULL, '', 7, '2017-10-08', 1),
  (62, 'PLCWTP8G', 'Ema', 'W.', 'ema@example.com', '6a9edcb7b63821802aa44d35d531c9fc', '', '0123456789', 'UK', 'Male', 'AB+', '2017-10-08', NULL, '', 8, '2017-10-08', 1),
  (63, 'PV53V0HJ', 'Alex', 'Goot', 'alex@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', '0123456789', '0123456789', 'Dhaka, Bangladesh', 'Male', 'AB+', '2000-10-10', NULL, 'assets/images/patient/dbfc50c1e24e726ae3745f523122ebc7.jpg', 2, '2017-10-10', 1),
  (64, 'P3LFN0JJ', 'Hello ', 'World', 'admin@demo.com', '9e5317e838cb5bd8e98a013fffc2b30e', '', '0123456879', 'Test', 'Male', '', '2017-11-15', NULL, '', 2, '2017-11-15', 1),
  (65, 'PHGWD0W0', 'HM', 'ISHAK', NULL, NULL, '0123456789', '0123456789', '0123456789', 'Male', 'O+', '2017-12-11', NULL, NULL, 2, '2017-12-11', 1),
  (66, 'P9XA38LW', 'Test', 'Test', NULL, NULL, '0123456789', '0123456789', 'Test', 'Male', 'B+', '2017-12-14', NULL, NULL, 2, '2017-12-14', 1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.pr_case_study
DROP TABLE IF EXISTS `pr_case_study`;
CREATE TABLE IF NOT EXISTS `pr_case_study` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(30) DEFAULT NULL,
  `food_allergies` varchar(255) DEFAULT NULL,
  `tendency_bleed` varchar(255) DEFAULT NULL,
  `heart_disease` varchar(255) DEFAULT NULL,
  `high_blood_pressure` varchar(255) DEFAULT NULL,
  `diabetic` varchar(255) DEFAULT NULL,
  `surgery` varchar(255) DEFAULT NULL,
  `accident` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `family_medical_history` varchar(255) DEFAULT NULL,
  `current_medication` varchar(255) DEFAULT NULL,
  `female_pregnancy` varchar(255) DEFAULT NULL,
  `breast_feeding` varchar(255) DEFAULT NULL,
  `health_insurance` varchar(255) DEFAULT NULL,
  `low_income` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

 
-- Dumping structure for table db_hospital_v260.pr_prescription
DROP TABLE IF EXISTS `pr_prescription`;
CREATE TABLE IF NOT EXISTS `pr_prescription` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointment_id` varchar(30) DEFAULT NULL,
  `patient_id` varchar(30) NOT NULL,
  `patient_type` varchar(50) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `chief_complain` text,
  `insurance_id` int(11) DEFAULT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `medicine` text,
  `diagnosis` text,
  `visiting_fees` float DEFAULT NULL,
  `patient_notes` text,
  `reference_by` varchar(50) DEFAULT NULL,
  `reference_to` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.schedule
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `available_days` varchar(50) DEFAULT NULL,
  `per_patient_time` time DEFAULT NULL,
  `serial_visibility_type` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.sms_delivery
DROP TABLE IF EXISTS `sms_delivery`;
CREATE TABLE IF NOT EXISTS `sms_delivery` (
  `sms_delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL,
  `delivery_date_time` datetime NOT NULL,
  `sms_info_id` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`sms_delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.sms_gateway
DROP TABLE IF EXISTS `sms_gateway`;
CREATE TABLE IF NOT EXISTS `sms_gateway` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` text NOT NULL,
  `user` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `authentication` text NOT NULL,
  `link` text NOT NULL,
  `default_status` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_gateway: ~2 rows (approximately)
/*!40000 ALTER TABLE `sms_gateway` DISABLE KEYS */;
INSERT IGNORE INTO `sms_gateway` (`gateway_id`, `provider_name`, `user`, `password`, `authentication`, `link`, `default_status`, `status`) VALUES
  (1, 'nexmo', '1d286ff1', '11a8b67955d4482f', 'Hospital', 'https://www.nexmo.com/', 1, 1),
  (2, 'clickatell', 'clickatell', '9d2e2d3aa558ddcb', 'Hospital', 'https://www.clickatell.com/', 0, 1);
/*!40000 ALTER TABLE `sms_gateway` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_info
DROP TABLE IF EXISTS `sms_info`;
CREATE TABLE IF NOT EXISTS `sms_info` (
  `sms_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sms_counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sms_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.sms_schedule
DROP TABLE IF EXISTS `sms_schedule`;
CREATE TABLE IF NOT EXISTS `sms_schedule` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_teamplate_id` int(11) NOT NULL,
  `ss_name` text NOT NULL,
  `ss_schedule` varchar(100) NOT NULL,
  `ss_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_schedule: ~4 rows (approximately)
/*!40000 ALTER TABLE `sms_schedule` DISABLE KEYS */;
INSERT IGNORE INTO `sms_schedule` (`ss_id`, `ss_teamplate_id`, `ss_name`, `ss_schedule`, `ss_status`) VALUES
  (1, 2, 'One', '1:1:1', 1),
  (2, 9, 'Summer offer', '10:3:0', 1);
/*!40000 ALTER TABLE `sms_schedule` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_setting
DROP TABLE IF EXISTS `sms_setting`;
CREATE TABLE IF NOT EXISTS `sms_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointment` tinyint(1) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `schedule` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_setting: ~0 rows (approximately)
/*!40000 ALTER TABLE `sms_setting` DISABLE KEYS */;
INSERT IGNORE INTO `sms_setting` (`id`, `appointment`, `registration`, `schedule`) VALUES
  (2, 1, 1, 1);
/*!40000 ALTER TABLE `sms_setting` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_teamplate
DROP TABLE IF EXISTS `sms_teamplate`;
CREATE TABLE IF NOT EXISTS `sms_teamplate` (
  `teamplate_id` int(11) NOT NULL AUTO_INCREMENT,
  `teamplate_name` text,
  `teamplate` text,
  `type` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `default_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teamplate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.sms_teamplate: ~4 rows (approximately)
/*!40000 ALTER TABLE `sms_teamplate` DISABLE KEYS */;
INSERT IGNORE INTO `sms_teamplate` (`teamplate_id`, `teamplate_name`, `teamplate`, `type`, `status`, `default_status`) VALUES
  (1, 'Appointment Template', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Appointment', 1, 1),
  (2, 'Schedule', 'Doctor, %doctor_name%. \r\nHello, %patient_name%. \r\nYour ID: %patient_id%, Appointment ID: %appointment_id%, Serial: %sequence% and Appointment Date: %appointment_date%. \r\nThank you for the Appointment.', 'Schedule', 1, 1),
  (3, 'Registration', 'Hello, %patient_name%. \r\nYour ID: %patient_id%,  \r\nThank you for the registration.', 'Registration', 1, 1),
  (4, 'Summer Offer', 'Hello, %patient_name%. Your ID: %patient_id%,\r\nYour promo code is 1010101.\r\nContact with us.\r\nThanks', 'Schedule', 1, 0);
/*!40000 ALTER TABLE `sms_teamplate` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.sms_users
DROP TABLE IF EXISTS `sms_users`;
CREATE TABLE IF NOT EXISTS `sms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver` varchar(20) DEFAULT NULL,
  `message` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- Dumping structure for table db_hospital_v260.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `user_role` tinyint(1) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `short_biography` text,
  `picture` varchar(255) DEFAULT NULL,
  `specialist` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.user: ~18 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `user_role`, `designation`, `department_id`, `address`, `phone`, `mobile`, `short_biography`, `picture`, `specialist`, `date_of_birth`, `sex`, `blood_group`, `degree`, `created_by`, `create_date`, `update_date`, `status`) VALUES
  (1, 'Samim Hasan', 'Khan', 'doctor@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Asstt. Profesor', 12, '98, Green Road, Farmgate, Dhaka -1205', '0123456798', '0123456798', '<p>TEST</p>', '', 'MBBS, DDB, FRSH', '2016-10-12', 'Male', 'A+', '<p>MBBS, DDB, FRSH</p>', 1, '2017-06-22', NULL, 1),
  (2, 'Jhon', 'Doe', 'admin@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, NULL, NULL, '98 Green Road, Farmgate, Dhaka-1215', NULL, '1922296392', NULL, 'assets/images/doctor/d49475ae2643ed555a40c75af42d074c.png', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-29', NULL, 1),
  (7, 'Hasan', 'Khan', 'receptionist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 7, NULL, NULL, 'TEST', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 7, '2017-03-16', NULL, 1),
  (8, 'Ashik', 'Islam', 'representative@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 8, NULL, NULL, 'Dhaka, Bangladesh', NULL, '0123456789', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-28', NULL, 1),
  (12, 'Dr. Elvera ', 'A. Lewis', 'elvera@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'MBBS', 12, '3028 University Street Redmond, WA 98052 ', '01888237267', '01888237267', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>', '', 'Nose', '0000-00-00', 'Male', 'A+', '<p><strong>Bachelor\'s degrees</strong> are offered at all 4-year colleges and universities, from large public institutions to small private colleges. The two most common types of bachelor\'s degrees are the Bachelor of Arts (B.A.) and Bachelor of Science (', 2, '2017-01-10', NULL, 1),
  (13, 'Dr.Mesut ', 'Alzain', 'mesut@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 13, '87,East Anadulala City ', '', '018111111111111', '', '', 'Neonatal', '1980-02-03', 'Male', 'A-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (14, 'Dr.Ykayama', 'Durusalaln', 'murat1@bdtask.com', '8ce87b8ec346ff4c80635f667d1592ae', 2, 'Professor ', 24, '231,East Patalipur,Sonamuri', '01711111122', '01911112223333', '', '', 'Urology ', '1980-01-01', 'Female', 'A+', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (15, 'Dr.Zesika', 'Hayat', 'hayat@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 15, '54,East Park Street,North Sonaimuri', '01711111122', '+0111133445782', '', '', 'Neurology ', '1991-05-23', 'Male', 'O-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (16, 'Dr.Dilmara ', 'Xyanturamana ', 'dilmara@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor ', 18, 'South Ferri Ghat,Padma River,Chandpur', '01711111122', '+0123111189323', '', '', 'Medicine ', '1980-03-05', 'Male', 'A-', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (17, 'Dr. Ahmed ', 'Abdullah', 'ahemd@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor ', 12, '231,East Patalipur,Sonamuri', '0182222221111', '01911112223333', '', '', 'Microbiologist ', '1968-01-01', 'Male', 'A+', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (18, 'Dr.Huyan', 'Xinan', 'xinan@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Assistant Professor ', 22, '231,East Patalipur,Sonamuri,Nkhali', '0181111111112222', '+0111133445782', '', '', 'Gynecologist ', '1985-01-12', 'Male', '', '<p>M.B.B.S,FCFS,Pharma.D,CCFA,NFDA</p>', 2, '2017-01-12', NULL, 1),
  (19, 'Ahmed', 'Ziniya', 'laboratorist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, NULL, NULL, '231,East Patalipur,Sonamuri', NULL, '+0111133445782', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 19, '2017-03-16', NULL, 1),
  (22, 'Dr. M', 'Murtaza', 'murtaz@bdtask.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 'Professor', 15, '56/C, East Burbank, North City ', '092222223333', '019833333222', '<p>Write about doctor in here.doctor short biography.</p>', 'assets/images/doctor/6bcba52aacac5732a876d931158a68b8.jpg', 'Neurology ', '1987-03-21', 'Male', 'A+', '<p>MBBS,FCCS,DPD,ORCH(NEU),MCCCO</p>\r\n<p>[removed][removed]</p>', 2, '2017-11-19', NULL, 1),
  (24, 'Meshu', 'Munawar', 'pharmacist@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 6, NULL, NULL, 'Dhaka', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 24, '2017-03-16', NULL, 1),
  (27, 'Tuhin', 'Sorkar', 'accountant@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 3, NULL, NULL, 'TEST', NULL, '018211555555', NULL, 'assets/images/human_resources/7a31e551a1ace6e0091ec7f32aa69031.jpg', NULL, '1970-01-01', 'Male', NULL, NULL, 2, '2017-10-29', NULL, 1),
  (29, 'Bay', 'Smith', 'nurse@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 5, NULL, NULL, 'Dhaka, Bangladesh', NULL, '018211555555', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 29, '2017-03-16', NULL, 1),
  (30, 'Tuhin', 'Abdullah', 'case@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 9, NULL, NULL, 'TEST', NULL, '0123456788', NULL, '', NULL, '1970-01-01', 'Male', NULL, NULL, 30, '2017-04-23', NULL, 1),
  (31, 'John', 'Doe', 'case2@demo.com', '827ccb0eea8a706c4c34a16891f84e7b', 9, NULL, NULL, 'India', NULL, '0123459689', NULL, '', NULL, NULL, 'Male', NULL, NULL, 2, '2017-10-28', NULL, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_comment
DROP TABLE IF EXISTS `ws_comment`;
CREATE TABLE IF NOT EXISTS `ws_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `add_to_website` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_comment: ~2 rows (approximately)
/*!40000 ALTER TABLE `ws_comment` DISABLE KEYS */;
INSERT IGNORE INTO `ws_comment` (`id`, `item_id`, `name`, `email`, `comment`, `date`, `add_to_website`) VALUES
  (64, 25, 'John Doe', 'doe@example.com', 'Hello World!', '2017-01-15 11:42:47', 1),
  (65, 24, 'Tanzil Ahmad', 'tanzil4091@gmail.com', 'I highly recommend this application for hospital management', '2017-01-16 01:50:48', 1);
/*!40000 ALTER TABLE `ws_comment` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_item
DROP TABLE IF EXISTS `ws_item`;
CREATE TABLE IF NOT EXISTS `ws_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `icon_image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `position` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `counter` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_item: ~16 rows (approximately)
/*!40000 ALTER TABLE `ws_item` DISABLE KEYS */;
INSERT IGNORE INTO `ws_item` (`id`, `name`, `icon_image`, `title`, `description`, `position`, `status`, `counter`, `date`) VALUES
  (24, 'blog', 'assets_web/images/icon_image/2017-01-12/t.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 1, 1, 27, '2017-01-12'),
  (25, 'blog', 'assets_web/images/icon_image/2017-01-12/e.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 2, 1, 27, '2017-01-12'),
  (26, 'blog', 'assets_web/images/icon_image/2017-01-12/d.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 3, 1, 5, '2017-01-12'),
  (27, 'blog', 'assets_web/images/icon_image/2017-01-12/m.jpg', 'Nullam et lorem quis risus porttitor sollicitudin vitae', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et sapien a leo imperdiet auctor. Nullam sollicitudin quam ut diam lacinia, non venenatis odio vehicula. Ut ultricies vel leo sit amet vestibulum. Curabitur elementum lacus sagittis dolor scelerisque, sit amet molestie nulla mattis. Aliquam eu semper diam. Sed vulputate bibendum erat ac luctus. Curabitur a pretium purus. Suspendisse quis suscipit eros. Cras felis odio, aliquam et rhoncus sit amet, dapibus eget tellus. Etiam porttitor lacus in nibh fringilla, id ullamcorper ipsum egestas. Vivamus dictum dui vel erat suscipit egestas. Pellentesque ut arcu eget sem pretium auctor a sed purus. Cras gravida lorem eu feugiat malesuada. Etiam sollicitudin enim quis neque viverra semper.</p>\r\n<p>Aenean ac feugiat urna, eu finibus velit. Nunc dictum ante a velit pharetra, ut ultrices ante posuere. Quisque a ante sodales dolor gravida pulvinar. Integer enim justo, pulvinar non feugiat at, venenatis eu ex. Nullam ac finibus orci. Aenean metus felis, euismod vitae sollicitudin quis, convallis eu diam. Vestibulum et dictum nisi. Phasellus dapibus dui urna, et pellentesque orci egestas vel. Aliquam iaculis urna sed metus consectetur luctus. Vivamus ac sagittis dui. Ut ultrices, mauris vel pulvinar suscipit, orci diam suscipit felis, sit amet imperdiet magna mauris a urna. Aliquam condimentum urna ipsum, a rutrum sapien dapibus in. Etiam eleifend lobortis velit, a consequat leo sodales sit amet. Pellentesque mattis, massa in sollicitudin accumsan, nibh nisl facilisis urna, a blandit nunc eros vel neque. Proin sed nisi sed eros condimentum maximus sit amet sed eros. Aenean interdum aliquam egestas.</p>\r\n<p>Nullam et lorem quis risus porttitor sollicitudin vitae nec arcu. Quisque rhoncus orci diam, eu fringilla lacus convallis a. Donec tincidunt enim in hendrerit varius. Maecenas vel vestibulum metus. Curabitur eleifend ut purus vel consequat. Aenean hendrerit pulvinar placerat. Suspendisse at accumsan leo. Aenean cursus tortor et augue efficitur faucibus. Integer eget ullamcorper dui. Aliquam porttitor ac risus ac malesuada.</p>', 4, 1, 0, '2017-01-12'),
  (28, 'service', 'assets_web/images/icon_image/2017-05-14/u3.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 1, 1, 0, '2017-05-14'),
  (29, 'service', 'assets_web/images/icon_image/2017-01-13/u.png', 'Call Center 24/7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 2, 1, 0, '2017-01-13'),
  (30, 'service', 'assets_web/images/icon_image/2017-01-13/h1.png', 'Cardiac Surgery', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 3, 1, 0, '2017-01-13'),
  (31, 'service', 'assets_web/images/icon_image/2017-01-13/D.png', 'Dental Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 4, 1, 0, '2017-01-13'),
  (32, 'service', 'assets_web/images/icon_image/2017-01-13/i.png', 'Ophthalmology', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 5, 1, 0, '2017-01-13'),
  (33, 'service', 'assets_web/images/icon_image/2017-05-14/u4.png', 'Neurology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non tellus quis ante vulputate mattis vitae id erat. Nulla in volutpat justo, et scelerisque dui. Suspendisse vel volutpat tortor, et porttitor erat. Phasellus in enim sed lorem ullamcorper convallis. Ut aliquam nulla vel metus eleifend pulvinar. Mauris vitae sem a augue sollicitudin semper. Integer finibus pretium suscipit. Nulla vehicula metus ligula, vel rutrum augue rhoncus ac. Sed sed tortor sed sapien porta porta non sit amet libero. Pellentesque dictum ex nec risus maximus, ut gravida felis tincidunt. Nunc sem ligula, elementum non tincidunt eu, lacinia vitae tortor. Pellentesque tincidunt libero id suscipit tincidunt. Ut enim dolor, consequat a hendrerit in, vulputate a risus. In pulvinar elit non turpis rhoncus, non mattis lectus fringilla.', 6, 1, 0, '2017-05-14'),
  (34, 'about', 'assets_web/images/icon_image/5adaedd86b35edde2f9de7e64d2b1ce2.jpg', 'ABOUT US', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed. Aenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt. Ut eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit. Phasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.', 1, 1, 1, '2017-10-28'),
  (35, 'about', 'assets_web/images/icon_image/2017-01-13/g.jpg', 'Our Vision & Mission ', '\r\n\r\n\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.\r\nAenean id ante blandit, mattis lacus ac, placerat elit. Vestibulum purus nisl, aliquam ut velit sed, fermentum bibendum ipsum. Vivamus sagittis mi ac erat fermentum, sed molestie tellus tincidunt. Curabitur mauris nisi, molestie viverra semper eget, elementum et odio. Etiam enim massa, fringilla eu malesuada in, volutpat eget sapien. Nunc aliquam diam in ex facilisis, non feugiat tellus tristique. Integer quis lorem at justo mollis dictum. Aenean nec nibh eget arcu faucibus dictum ac sit amet augue. Aliquam quis rhoncus ex. In euismod felis mauris, vel euismod risus ornare sit amet. Nunc iaculis nec dolor vel eleifend. Sed quis felis at enim faucibus commodo. Donec quis condimentum velit, sit amet luctus leo. Curabitur a volutpat lorem. Duis ut leo quis erat pellentesque tincidunt.\r\nUt eu enim eu ante faucibus tincidunt. Maecenas lorem purus, cursus in massa nec, convallis porta velit. Etiam aliquet tortor sed fermentum tempor. Maecenas quis ornare lacus, eu maximus purus. Mauris et pellentesque tellus, sed ullamcorper ipsum. Sed non volutpat risus. Donec sit amet sem vitae purus mollis sodales. Suspendisse ut ipsum sed lorem feugiat congue sed non tortor. Mauris laoreet lorem sed varius placerat. Nullam tincidunt neque vitae eros ullamcorper, laoreet finibus erat convallis. Vestibulum vehicula turpis dui, vitae ultrices ante fermentum in. Sed laoreet pharetra pretium. In hac habitasse platea dictumst. Morbi a bibendum velit.\r\nPhasellus luctus dignissim quam, et elementum mi aliquam sed. In non tortor nec libero porta egestas. Fusce id dictum augue, non condimentum eros. In in mi arcu. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam euismod dictum justo vel condimentum. Donec leo mauris, ultrices ac risus nec, efficitur finibus eros. Ut ut blandit ex, vel porta nulla. Integer ut dapibus lectus. Duis sollicitudin metus ipsum, vitae euismod nisl sagittis et.\r\n\r\n\r\n', 2, 1, 0, '2017-01-13'),
  (36, 'appointment', 'assets_web/images/icon_image/2017-01-13/6.png', 'Emergency Care', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 1, 1, 0, '2017-01-13'),
  (37, 'appointment', 'assets_web/images/icon_image/2017-01-13/5.png', 'Test Appointment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 2, 1, 0, '2017-01-13'),
  (38, 'appointment', 'assets_web/images/icon_image/2017-01-13/N1.png', 'Neurology Surgery ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 3, 1, 0, '2017-02-20'),
  (39, 'appointment', 'assets_web/images/icon_image/2017-05-14/51.png', 'Oncology ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ipsum magna, gravida nec erat ac, malesuada pharetra felis. Phasellus eu dolor orci. Duis et dictum sem, sit amet sagittis dolor. Curabitur scelerisque, nunc eget viverra malesuada, nunc ligula tincidunt nisi, eget elementum urna magna at dui. Praesent eu tincidunt arcu. Ut imperdiet a ligula nec dapibus. Aliquam erat volutpat. Donec auctor elementum accumsan. Vestibulum velit augue, feugiat ac nisl in, pharetra accumsan ligula. Proin nunc mauris, ultrices quis tristique vitae, ornare quis nunc. Aenean ut tincidunt lorem. Maecenas consectetur faucibus velit, nec tincidunt nulla fermentum sed.', 4, 1, 0, '2017-05-14');
/*!40000 ALTER TABLE `ws_item` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_section
DROP TABLE IF EXISTS `ws_section`;
CREATE TABLE IF NOT EXISTS `ws_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `featured_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_section: ~6 rows (approximately)
/*!40000 ALTER TABLE `ws_section` DISABLE KEYS */;
INSERT IGNORE INTO `ws_section` (`id`, `name`, `title`, `description`, `featured_image`) VALUES
  (19, 'service', 'Service We Offer', 'Our department & special service ', 'assets_web/images/uploads/2016-11-02/b.jpg'),
  (20, 'about', 'About Us', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature froLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,m 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.', 'assets_web/images/uploads/c9995ec146f42d86911bb35a39f3f280.jpg'),
  (23, 'appointment', 'Why Choose Us', 'Our department & special service ', 'assets_web/images/uploads/2016-11-06/d.png'),
  (26, 'doctor', 'OUR DOCTOR', 'Our department & special service ', 'assets_web/images/uploads/2016-11-05/d.png'),
  (27, 'department', 'DEPARTMENT', 'Our department & special service ', ''),
  (28, 'blog', 'Latest Blog', 'Latest topics of the webstie', 'assets_web/images/uploads/2016-11-05/c.png');
/*!40000 ALTER TABLE `ws_section` ENABLE KEYS */;

-- Dumping structure for table db_hospital_v260.ws_slider
DROP TABLE IF EXISTS `ws_slider`;
CREATE TABLE IF NOT EXISTS `ws_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table db_hospital_v260.ws_slider: ~3 rows (approximately)
/*!40000 ALTER TABLE `ws_slider` DISABLE KEYS */;
INSERT IGNORE INTO `ws_slider` (`id`, `title`, `subtitle`, `description`, `image`, `position`, `status`) VALUES
  (1, 'Lorem Ipsum is simply dummy text of the printing ', 'Lorem Ipsum is simply dummy text of the printing ', '<p>Lorem Ipsum is simply dummy text of the printingLorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing</p>', 'assets_web/images/slider/2016-11-03/a2.jpg', 3, 1),
  (2, 'Welcome to', 'Demo Hospital', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting</p>', 'assets_web/images/slider/2017-01-16/d1.jpg', 1, 1),
  (3, 'Second Slide ', 'Welcome back - Second slide', '<p><strong>Lorem Ipsum</strong></p>\r\n<hr />\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,</p>\r\n<ul>\r\n<li>Demo Hospital Limited</li>\r\n<li>&lt;script&gt;alert(2)&lt;/script&gt;</li>\r\n</ul>', 'assets_web/images/slider/2016-11-03/s.jpg', 1, 1);
/*!40000 ALTER TABLE `ws_slider` ENABLE KEYS */;

