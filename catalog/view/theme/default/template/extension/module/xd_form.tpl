<!-- xd form module start -->
<?php if ($status) { ?>
    <div id="xd_form_success" class="modal fade <?= $modal_style ?>">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z" />
                        </svg>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"><?php echo $success_field; ?></div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <div id="xd_form_module">
        <div id="xd_form_box" class="<?php echo $box_classes; ?>" <?php echo $box_styles_inline; ?>>
            <div id="xd_form_content" class="<?php echo $content_classes; ?>" <?php echo $content_styles_inline; ?>>
                <?php if ($form_title !== '') { ?>
                    <div id="xd_form_title">
                        <span class="form-title text-center"><?php echo $form_title; ?></span>
                    </div>
                <?php } ?>
                <?php if ($form_subtitle !== '') { ?>
                    <div id="xd_form_subtitle">
                        <?php echo $form_subtitle ?>
                    </div>
                <?php } ?>
                <form id="xd_form-form" action="index.php?route=module/xd_form/send" role="form">
                    <div id="source" class="hide" style="display:none">
                        <input id="xd_form_sb_first_typ" class="hidden" type="text" name="xd_form_sb_first_typ" value="">
                        <input id="xd_form_sb_first_src" class="hidden" type="text" name="xd_form_sb_first_src" value="">
                        <input id="xd_form_sb_first_mdm" class="hidden" type="text" name="xd_form_sb_first_mdm" value="">
                        <input id="xd_form_sb_first_cmp" class="hidden" type="text" name="xd_form_sb_first_cmp" value="">
                        <input id="xd_form_sb_first_cnt" class="hidden" type="text" name="xd_form_sb_first_cnt" value="">
                        <input id="xd_form_sb_first_trm" class="hidden" type="text" name="xd_form_sb_first_trm" value="">

                        <input id="xd_form_sb_current_typ" class="hidden" type="text" name="xd_form_sb_current_typ" value="">
                        <input id="xd_form_sb_current_src" class="hidden" type="text" name="xd_form_sb_current_src" value="">
                        <input id="xd_form_sb_current_mdm" class="hidden" type="text" name="xd_form_sb_current_mdm" value="">
                        <input id="xd_form_sb_current_cmp" class="hidden" type="text" name="xd_form_sb_current_cmp" value="">
                        <input id="xd_form_sb_current_cnt" class="hidden" type="text" name="xd_form_sb_current_cnt" value="">
                        <input id="xd_form_sb_current_trm" class="hidden" type="text" name="xd_form_sb_current_trm" value="">

                        <input id="xd_form_sb_first_add_fd" class="hidden" type="text" name="xd_form_sb_first_add_fd" value="">
                        <input id="xd_form_sb_first_add_ep" class="hidden" type="text" name="xd_form_sb_first_add_ep" value="">
                        <input id="xd_form_sb_first_add_rf" class="hidden" type="text" name="xd_form_sb_first_add_rf" value="">

                        <input id="xd_form_sb_current_add_fd" class="hidden" type="text" name="xd_form_sb_current_add_fd" value="">
                        <input id="xd_form_sb_current_add_ep" class="hidden" type="text" name="xd_form_sb_current_add_ep" value="">
                        <input id="xd_form_sb_current_add_rf" class="hidden" type="text" name="xd_form_sb_current_add_rf" value="">

                        <input id="xd_form_sb_session_pgs" class="hidden" type="text" name="xd_form_sb_session_pgs" value="">
                        <input id="xd_form_sb_session_cpg" class="hidden" type="text" name="xd_form_sb_session_cpg" value="">

                        <input id="xd_form_sb_udata_vst" class="hidden" type="text" name="xd_form_sb_udata_vst" value="">
                        <input id="xd_form_sb_udata_uip" class="hidden" type="text" name="xd_form_sb_udata_uip" value="">
                        <input id="xd_form_sb_udata_uag" class="hidden" type="text" name="xd_form_sb_udata_uag" value="">
                        <input id="xd_form_sb_promo_code" class="hidden" type="text" name="xd_form_sb_promo_code" value="">
                    </div>
                    <input id="xd_form_success_type" class="hidden" type="text" name="xd_form_success_type" value="<?= $success_type ?>">
                    <input id="xd_form_success_utm" class="hidden" type="text" name="xd_form_success_utm" value="<?= $success_utm ?>">
                    <?php if ($field1_status > 0) { ?>
                        <div class="input-group<?= ($field1_status === 2) ? ' has-warning' : '' ?>">
                            <span class="input-group-addon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                                </svg>
                            </span>
                            <input id="xd_form_name" class="form-control xd_form-input<?= ($field1_status === 2) ? ' required' : '' ?>" type="text" name="xd_form_name" placeholder="<?php echo $field1_title; ?>">
                        </div>
                        <br />
                    <?php } ?>
                    <?php if ($spam_protection) { ?>
                        <div class="input-group input-group-protected">
                            <span class="input-group-addon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
                                    <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5M.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5" />
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                </svg>
                            </span>
                            <input id="xd_form_surname" class="form-control xd_form-input" type="text" name="xd_form_surname" placeholder="Surname">
                        </div>
                    <?php } ?>
                    <?php if ($field2_status > 0) { ?>
                        <div class="input-group<?= ($field2_status === 2) ? ' has-warning' : '' ?>">
                            <span class="input-group-addon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                    <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                                </svg>
                            </span>
                            <input id="xd_form_phone" class="form-control xd_form-input<?= ($field2_status === 2) ? ' required' : '' ?>" type="tel" name="xd_form_phone" placeholder="<?php echo $field2_title; ?>">
                        </div>
                        <br />
                    <?php } ?>
                    <?php if ($field3_status > 0) { ?>
                        <div class="input-group<?= ($field3_status === 2) ? ' has-warning' : '' ?>">
                            <span class="input-group-addon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
                                    <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2zm3.708 6.208L1 11.105V5.383zM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2z" />
                                    <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648m-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z" />
                                </svg>
                            </span>
                            <input id="xd_form_email" class="form-control xd_form-input<?= ($field3_status === 2) ? ' required' : '' ?>" type="email" name="xd_form_email" placeholder="<?php echo $field3_title; ?>">
                        </div>
                        <br />
                    <?php } ?>
                    <?php if ($field4_status > 0) { ?>
                        <div class="form-group<?= ($field4_status === 2) ? ' has-warning' : '' ?>">
                            <textarea id="xd_form_message" class="form-control xd_form-input<?= ($field4_status === 2) ? ' required' : '' ?>" name="xd_form_message" rows="3" placeholder="<?php echo $field4_title; ?>"></textarea>
                        </div>
                    <?php } ?>
                    <?php if ($field_custom_status > 0) { ?>
                        <div class="form-group form-group-custom <?= ($field_custom_status === 2) ? ' has-warning' : '' ?>">
                            <label for="xd_form_custom" class="control-label"><?php echo $field_custom_title; ?></label>
                            <?php if ($field_custom_type === 'text') { ?>
                                <input id="xd_form_custom" class="form-control xd_form-input<?= ($field_custom_status === 2) ? ' required' : '' ?>" type="text" name="xd_form_custom" placeholder="<?php echo $field_custom_title; ?>">
                            <?php } else if ($field_custom_type === 'textarea') { ?>
                                <textarea id="xd_form_custom" class="form-control xd_form-input<?= ($field_custom_status === 2) ? ' required' : '' ?>" name="xd_form_custom" rows="3" placeholder="<?php echo $field_custom_title; ?>"></textarea>
                            <?php } ?>
                        </div>
                    <?php } ?>
                    <?php if (boolval($captcha)) { ?>
                        <div id="xd_form_captcha" class="captcha <?= $captcha_class ?>">
                            <?php echo $captcha; ?>
                        </div>
                    <?php } ?>

                    <div class="clearfix"></div>

                    <?php if ($agree_status !== 0) { ?>
                        <div class="text-left">
                            <p class="information p-0 m-0"><?php echo $text_agree; ?></p>
                        </div>
                        <div class="clearfix"></div>
                    <?php } ?>
                    <hr />
                    <p id="xd_form_error" class="text-danger pb-1 m-0"></p>
                    <div class="w-100 text-center">
                        <button type="submit" id="xd_form-submit" class="btn btn-primary btn-block"><?php echo $form_submit ?></button>
                    </div>
                </form>
                <?php if ($form_bottom !== '') { ?>
                    <div id="xd_form_bottom">
                        <?php echo $form_bottom; ?>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            <?php if ($validation_type !== '0') { ?>
                $('#xd_form_phone').mask('<?= $validation_type ?>');
            <?php } ?>
            <?php if ($exan_status) { ?>
                sbjs.init();
                xdFormPlaceData(sbjs.get);
            <?php } ?>
        });
        <?php if ($exan_status) { ?>

            function xdFormPlaceData(sb) {
                console.log(sb);
                document.getElementById('xd_form_sb_first_typ').value = sb.first.typ;
                document.getElementById('xd_form_sb_first_src').value = sb.first.src;
                document.getElementById('xd_form_sb_first_mdm').value = sb.first.mdm;
                document.getElementById('xd_form_sb_first_cmp').value = sb.first.cmp;
                document.getElementById('xd_form_sb_first_cnt').value = sb.first.cnt;
                document.getElementById('xd_form_sb_first_trm').value = sb.first.trm;

                document.getElementById('xd_form_sb_current_typ').value = sb.current.typ;
                document.getElementById('xd_form_sb_current_src').value = sb.current.src;
                document.getElementById('xd_form_sb_current_mdm').value = sb.current.mdm;
                document.getElementById('xd_form_sb_current_cmp').value = sb.current.cmp;
                document.getElementById('xd_form_sb_current_cnt').value = sb.current.cnt;
                document.getElementById('xd_form_sb_current_trm').value = sb.current.trm;

                document.getElementById('xd_form_sb_first_add_fd').value = sb.first_add.fd;
                document.getElementById('xd_form_sb_first_add_ep').value = sb.first_add.ep;
                document.getElementById('xd_form_sb_first_add_rf').value = sb.first_add.rf;

                document.getElementById('xd_form_sb_current_add_fd').value = sb.current_add.fd;
                document.getElementById('xd_form_sb_current_add_ep').value = sb.current_add.ep;
                document.getElementById('xd_form_sb_current_add_rf').value = sb.current_add.rf;

                document.getElementById('xd_form_sb_session_pgs').value = sb.session.pgs;
                document.getElementById('xd_form_sb_session_cpg').value = sb.session.cpg;

                document.getElementById('xd_form_sb_udata_vst').value = sb.udata.vst;
                document.getElementById('xd_form_sb_udata_uip').value = sb.udata.uip;
                document.getElementById('xd_form_sb_udata_uag').value = sb.udata.uag;

                document.getElementById('xd_form_sb_promo_code').value = sb.promo.code;
            }
        <?php } ?>

        /* Analytics */
        function xdFormClickAnalytics() {
            console.log('formClickAnalytics');
            <?php if ($ya_status && $ya_counter != '' && $ya_identifier != '') { ?>
                yaCounter<?= $ya_counter ?>.reachGoal('<?= $ya_identifier ?>');
            <?php } ?>
            <?php if ($google_status && $google_category_btn != '' && $google_action_btn != '') { ?>
                ga('send', 'event', '<?= $google_category_btn ?>', '<?= $google_action_btn ?>');
                gtag('event', '<?= $google_action_btn ?>', {
                    'event_category': '<?= $google_category_btn ?>'
                });
            <?php } ?>
            return true;
        }

        function xdFormClickAnalyticsSend() {
            console.log('formClickAnalyticsSend');
            <?php if ($ya_status && $ya_counter != '' && $ya_identifier_send != '') { ?>
                yaCounter<?= $ya_counter ?>.reachGoal('<?= $ya_identifier_send ?>');
            <?php } ?>
            <?php if ($google_status && $google_category_send != '' && $google_action_send != '') { ?>
                ga('send', 'event', '<?= $google_category_send ?>', '<?= $google_action_send ?>');
                gtag('event', '<?= $google_action_send ?>', {
                    'event_category': '<?= $google_category_send ?>'
                });
            <?php } ?>
            return true;
        }

        function xdFormClickAnalyticsSuccess() {
            console.log('formClickAnalyticsSuccess');
            <?php if ($ya_status && $ya_counter != '' && $ya_identifier_success != '') { ?>
                yaCounter<?= $ya_counter ?>.reachGoal('<?= $ya_identifier_success ?>');
            <?php } ?>
            <?php if ($google_status && $google_category_success != '' && $google_action_success != '') { ?>
                ga('send', 'event', '<?= $google_category_success ?>', '<?= $google_action_success ?>');
                gtag('event', '<?= $google_action_success ?>', {
                    'event_category': '<?= $google_category_success ?>'
                });
            <?php } ?>
            return true;
        }

        function stretchFullWidth(selector) {
            const module = document.querySelector(selector);
            if (!module) return;

            // Calculate scrollbar width
            const scrollbarWidth = window.innerWidth - document.documentElement.clientWidth;
            document.documentElement.style.setProperty('--scrollbar-width', `${scrollbarWidth}px`);

            // Set element width to full viewport width
            const viewportWidth = document.documentElement.clientWidth;
            module.style.width = `${viewportWidth}px`;
            module.style.marginLeft = `-${viewportWidth / 2}px`;
            module.style.marginRight = `-${viewportWidth / 2}px`;
        }

        // Initial stretch on page load
        document.addEventListener('DOMContentLoaded', function() {
            stretchFullWidth('.xd_form_fullwidth');
        });

        // Stretch on window resize
        window.addEventListener('resize', function() {
            setTimeout(function() {
                stretchFullWidth('.xd_form_fullwidth');
            }, 10); // Delay to ensure the resize is complete
            // stretchFullWidth('.xd_form_fullwidth');
        });
    </script>
<?php } ?>
<!-- xd form module end -->