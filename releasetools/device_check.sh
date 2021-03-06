#!/sbin/sh
#
# Copyright (C) 2017 LineageOS Project
#
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
#

PRODUCT_MODEL=`getprop ro.product.model`
NFC_MODEL="Y635-L21"

RESULT=$(echo $NFC_MODEL | grep "$PRODUCT_MODEL")

if [[ "$RESULT" = "" ]]
then
    # Remove NFC
    rm -rf /system/vendor/app/QNfc
    rm -rf /system/vendor/app/GsmaNfcService
    rm -rf /system/priv-app/Tag
    rm -rf /system/etc/*nfc*
    rm -rf /system/etc/permissions/*nfc*
    rm -rf /system/etc/permissions/*gsma*
    rm -rf /system/framework/*nfc*
    rm -rf /system/framework/*gsma*
    rm -rf /system/vendor/lib/*nfc*
    rm -rf /system/vendor/lib/hw/nfc_nci.qc199x.default.so
fi
