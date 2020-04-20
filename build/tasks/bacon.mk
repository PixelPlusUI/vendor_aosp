# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 The PixelExperience Project
# Copyright (C) 2020 The PixelPlusUI Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CUSTOM_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CUSTOM_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(CUSTOM_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CUSTOM_TARGET_PACKAGE).md5sum
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"______ _          _______ _           _   _ _____ "${CL_CYN}
	@echo -e ${CL_CYN}"| ___ (_)        | | ___ \ |         | | | |_   _|"${CL_CYN}
	@echo -e ${CL_CYN}"| |_/ /___  _____| | |_/ / |_   _ ___| | | | | |  "${CL_CYN}
	@echo -e ${CL_CYN}"|  __/| \ \/ / _ \ |  __/| | | | / __| | | | | |  "${CL_CYN}
	@echo -e ${CL_CYN}"| |   | |>  <  __/ | |   | | |_| \__ \ |_| |_| |_ "${CL_CYN}
	@echo -e ${CL_CYN}"\_|   |_/_/\_\___|_\_|   |_|\__,_|___/\___/ \___/ "${CL_CYN}
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"===========-Package Completed-==========="${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(CUSTOM_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"MD5: "${CL_YLW}" `cat $(CUSTOM_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"SHA256: "${CL_YLW}" `sha256sum $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size: "${CL_YLW}" `ls -l $(CUSTOM_TARGET_PACKAGE) | cut -d ' ' -f 5` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Timestamp: "${CL_MAG} $(CUSTOM_BUILD_DATE_UTC) ${CL_RST}
	@echo -e ${CL_CYN}"===========-----Thanks :)-----==========="${CL_RST}
	@echo -e ""
