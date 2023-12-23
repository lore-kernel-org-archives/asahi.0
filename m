Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4759469
	for <asahi@lists.linux.dev>; Sat, 23 Dec 2023 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO8wgxqR"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e60d67e6aso2150070e87.1
        for <asahi@lists.linux.dev>; Sat, 23 Dec 2023 02:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703327305; x=1703932105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LKlgi0WgXgWSamw2heMy8ePsjTLXgs38S9A0y/+1JA=;
        b=KO8wgxqRozSihrAlQTENOLXveBEQvltcO7cMUTyWsuPOAQEVD/Xo0yeNUwBU9it6p1
         jYvFev4jA9wNq6sosaFY8e35q68cJs9fGTar9uNY0xcws8IxPesXtyi4emlAZDvTnP6s
         2YbI2Jket/Q2q6sj86gnem2PbWCEgIKpPz4L5uLQsSuqfbg4SL1DjyvMPaYiCUOGSWz/
         eu2DR5LFMlyPQvnKgQQ9nrsy6pQyROXKdIdy2GSYg9gJG2tHkBT4hAW788Imw0Y+SA1j
         Ko5Dk9HxoHi75iUTsYtDISIonYcvHHd8VQm8GOLK3eLD0D7/OxMh/loI0RKTBbETR2Ji
         yX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703327305; x=1703932105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LKlgi0WgXgWSamw2heMy8ePsjTLXgs38S9A0y/+1JA=;
        b=nYkj0+ejS5SCIS6hMU5C+MchiRpgCUUavgFDZDV519/t5lkDZiH/c6M+BkBRpNfUiH
         2lG1BM3tSUUirYyDZOEOUE7p8lkMQlFyjhQnKCU7UWlItsL8fpuHKVCjPy+4saOJ3Re0
         qbKIglINMU4LjQEL2sb4pAIjDsJIS8k/wqF56iyfh0poTg9ehBb4GnxzGnymVU/BaV70
         LeguXhpWz2YlKeDpxjkBXcL5sNV3b0IiLRYWjQz9ikQUkWwTlrSh7cnqXTqDpiG6+M7b
         DwMr9qyrV+WElWhrPwCggYhB1K+8Z8Ay9Q34yVCs3M63AJX4HoeXmjBD7l9Ahr0bFBWK
         GY/g==
X-Gm-Message-State: AOJu0YzDaKYQSEy5oeSrZTpATi5mVvHvjUredzw47YmCcveB4nnLab+B
	RhGK8PVa2pBsM73ZcbY+J7M=
X-Google-Smtp-Source: AGHT+IGygdt69KOd/eAMonikSQjl458gUPpbMY6rGNjoFkh3rUtUNXiJitQaB4LmN/NjcnwBCKw3nQ==
X-Received: by 2002:a05:6512:4027:b0:50e:3cb5:cf1f with SMTP id br39-20020a056512402700b0050e3cb5cf1fmr2450626lfb.24.1703327304935;
        Sat, 23 Dec 2023 02:28:24 -0800 (PST)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id b21-20020a056512061500b0050bf0c77bd6sm194864lfe.115.2023.12.23.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 02:28:24 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3BNASLh2027301;
	Sat, 23 Dec 2023 13:28:22 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3BNASKNX027300;
	Sat, 23 Dec 2023 13:28:20 +0300
Date: Sat, 23 Dec 2023 13:28:19 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Hector Martin <marcan@marcan.st>
Cc: Daniel Berlin <dberlin@dberlin.org>, asahi@lists.linux.dev
Subject: Testing bits/080-wifi on BCM4345/6 (was: Re: [PATCH] wifi: brcmfmac:
 cfg80211: Use WSEC to set SAE password)
Message-ID: <ZYa2Q8ALPbr09L4b@home.paul.comp>
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <ZYK/C3LzK8LMOjER@home.paul.comp>
 <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sRDlzrqLmOBKA44t"
Content-Disposition: inline
In-Reply-To: <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>


--sRDlzrqLmOBKA44t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Trimming the CC list to only those involved in this downstream branch.

On Thu, Dec 21, 2023 at 03:02:00AM +0900, Hector Martin wrote:
> Are you willing to test all the other wifi stuff we have queued up
> downstream? There's a whole pile of changes here:
> 
> https://github.com/AsahiLinux/linux/commits/bits/080-wifi/

I gave this a quick test on Ampack AP6255 (BCM4345/6) which is an SDIO
module inside "Pinebook Pro". I used the branch as is, so everything
else is vanilla upstream 6.6.

Firmware (and clm_blob and txt) are from Linux firmware git tree:
[  395.218191] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Apr 15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2
[  395.219641] brcmfmac: brcmf_c_preinit_dcmds CLM version = API: 12.2 Data: Cypress.CYW43455 Compiler: 1.29.4 ClmImport: 1.36.3 Customization: v1 200520 Creation: 2021-04-15 02:48:59 
[  395.223732] brcmfmac: brcmf_feat_firmware_capabilities [ ap sta wme 802.11d 802.11h rm cqa cac dualband ampdu ampdu_tx ampdu_rx amsdurx radio_pwrsave btamp p2p proptxstatus mchan p2po anqpo vht-prop-rates dfrts txpwrcache stbc-tx stbc-rx-1ss epno pfnx wnm bsstrans mfp sae idauth ]


What was tested (all on 2.4 GHz band):

1. STA mode for connecting to WPA2-CCMP, no regressions compared to 6.4;

2. STA mode against WPA3 Personal, connecting and short ssh
session, works only after reverting the SAE patch;

3. AP mode Open/WPA/WPA2-TKIP/WPA2-RSN works before and after;
enabling mandatory 802.11w prevents AP from starting (a message about
mismatching parameters is emitted to dmesg), making it optional
produces no errors but the AP didn't beacon;

4. AP mode WPA3 SAE starts and beacons but connection to it is
impossible (probably due to a user error, haven't tested much).


I'm attaching a debug INFO log for driver startup for your
reference. Also attached are capabilities as reported by "iw list"
before and after.


The capabilities raise questions so I'd like to discuss some
diff hunks individually.

> +               * CCMP-256 (00-0f-ac:10)
> +               * GCMP-128 (00-0f-ac:8)
> +               * GCMP-256 (00-0f-ac:9)
> +               * CMAC-256 (00-0f-ac:13)
> +               * GMAC-128 (00-0f-ac:11)
> +               * GMAC-256 (00-0f-ac:12)

I only have easy means to test WPA3 Personal (without FT) so
00-0f-ac:8. I might be able to try WPA3 EAP later if really needed but
since I never configured it before that might be problematic. Where
"AP PeerKey" protocol is used I do not even have an idea (WPA3-secured
meshes? but capabilities indicate 802.11s isn't supported at all).

> -       Available Antennas: TX 0 RX 0
> +       Available Antennas: TX 0x1 RX 0x1

This is good.

> +               HE Iftypes: managed
> +                       HE MAC Capabilities (0x0c074a180040):
> ...

Because he_enable is an auto variable without an initial value the new
code misdetects presence of HE capabilities.

> -                       * 2412 MHz [1] (20.0 dBm)
> +                       * 2412 MHz [1] (30.0 dBm)

Not sure if this is correct for the hardware or not, the datasheet
claims maximum output power 14 dBm for 802.11n on this band.

> +                       * 2467 MHz [12] (disabled)
> +                       * 2472 MHz [13] (disabled)
> +                       * 2484 MHz [14] (disabled)

Hm, they were enabled. I'm running without a regulatory database, so
all defaults. Probably makes sense that they're not available in this
case, but will they get enabled if regulatory is set correctly?

> -               VHT Capabilities (0x00001020):
> +               VHT Capabilities (0x33801030):
>                         Max MPDU length: 3895
>                         Supported Channel Width: neither 160 nor 80+80
> +                       RX LDPC

Not sure how to test if this works.

>                         short GI (80 MHz)
>                         SU Beamformee
> +                       RX antenna pattern consistency
> +                       TX antenna pattern consistency

Makes sense for a 1x1 device.

> -               VHT RX highest supported: 0 Mbps
> +               VHT RX highest supported: 433 Mbps
...
> -               VHT TX highest supported: 0 Mbps
> +               VHT TX highest supported: 433 Mbps

Good.

> -                       * 5170 MHz [34] (20.0 dBm)
> -                       * 5180 MHz [36] (20.0 dBm)
> -                       * 5190 MHz [38] (20.0 dBm)
> -                       * 5200 MHz [40] (20.0 dBm)
> +                       * 5170 MHz [34] (disabled)
> +                       * 5180 MHz [36] (30.0 dBm)
> +                       * 5190 MHz [38] (disabled)
> +                       * 5200 MHz [40] (30.0 dBm)

VHT40, VHT80 disabled by regulatory? The datasheet claims 12 dBm for
802.11ac, not sure how that translates into dBm here.

> +       Device supports low priority scan.
> +               * [ LOW_SPAN_SCAN ]: low span scan
> +               * [ LOW_POWER_SCAN ]: low power scan
> +               * [ HIGH_ACCURACY_SCAN ]: high accuracy scan

No idea how to test.

I also spotted interesting combinations that didn't change:

>         valid interface combinations:
>                   * #{ managed } <= 2, #{ P2P-device } <= 1, #{ P2P-client, P2P-GO } <= 1,
>                     total <= 3, #channels <= 2

This means that I should be able to create two VIFs on same phy and
they should be able to connect to APs on different channels. That is
unusual and probably not true for this hardware, but I haven't tested.

>                   * #{ managed } <= 1, #{ AP } <= 1, #{ P2P-client } <= 1, #{ P2P-device } <= 1,
>                     total <= 4, #channels <= 1

This means I should be able to run a client and an AP on the same PHY
at the same time, but only if they share the channel. This might be
useful, but I haven't tried it yet.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com

--sRDlzrqLmOBKA44t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="brcmfmac-debug.txt"

[  395.072045] brcmfmac: F1 signature read @0x18000000=0x15264345
[  395.072677] brcmfmac: brcmf_chip_recognition found AXI chip: BCM4345/6
[  395.074614] brcmfmac: brcmf_chip_cores_check  [1 ] core 0x800:51  base 0x18000000 wrap 0x18100000
[  395.075298] brcmfmac: brcmf_chip_cores_check  [2 ] core 0x812:54  base 0x18001000 wrap 0x18101000
[  395.075970] brcmfmac: brcmf_chip_cores_check  [3 ] core 0x83e:9   base 0x18002000 wrap 0x18102000
[  395.076655] brcmfmac: brcmf_chip_cores_check  [4 ] core 0x83c:14  base 0x18003000 wrap 0x18103000
[  395.077339] brcmfmac: brcmf_chip_cores_check  [5 ] core 0x829:21  base 0x18004000 wrap 0x18104000
[  395.078010] brcmfmac: brcmf_chip_cores_check  [6 ] core 0x135:0   base 0x00000000 wrap 0x18107000
[  395.078694] brcmfmac: brcmf_chip_cores_check  [7 ] core 0x240:0   base 0x00000000 wrap 0x00000000
[  395.080362] brcmfmac: brcmf_chip_get_raminfo RAM: base=0x198000 size=819200 (0xc8000) sr=0 (0x0)
[  395.081085] brcmfmac: brcmf_chip_setup ccrev=51, pmurev=27, pmucaps=0x39d05f1b
[  395.081641] brcmfmac: brcmf_get_module_param Enter, bus=0, chip=17221, rev=6
[  395.082212] brcmfmac: brcmf_sdio_drivestrengthinit No SDIO driver strength init needed for chip BCM4345/6 rev 6 pmurev 27
[  395.083640] brcmfmac: brcmf_sdio_probe completed!!
[  395.083992] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-sdio for chip BCM4345/6
[  395.097438] OF: graph: no port node found in /i2c@ff3d0000/fusb30x@22
[  395.104500] brcmfmac: brcmf_sdio_verifymemory Compare RAM dl & ul at 0x00198000; size=643651
[  395.131027] brcmfmac: brcmf_sdio_verifymemory Compare RAM dl & ul at 0x0025f950; size=1712
[  395.207823] brcmfmac: brcmf_sdio_firmware_callback enable F2: err=0
[  395.208335] brcmfmac: brcmf_sdio_firmware_callback set F2 watermark to 0x60*4 bytes
[  395.208991] brcmfmac: brcmf_sdio_sr_init SR enabled
[  395.209324] brcmfmac: brcmf_bus_change_state ignoring transition, bus not attached yet
[  395.210006] brcmfmac: brcmf_wcc_attach: executing
[  395.210339] brcmfmac: brcmf_add_if allocate netdev interface
[  395.211193] brcmfmac: brcmf_sdio_readshared sdpcm_shared address 0x00208AC0
[  395.212451] brcmfmac: brcmf_sdio_readshared sdpcm_shared address 0x00208AC0
[  395.217200] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
[  395.218191] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Apr 15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2
[  395.219641] brcmfmac: brcmf_c_preinit_dcmds CLM version = API: 12.2 Data: Cypress.CYW43455 Compiler: 1.29.4 ClmImport: 1.36.3 Customization: v1 200520 Creation: 2021-04-15 02:48:59 
[  395.223732] brcmfmac: brcmf_feat_firmware_capabilities [ ap sta wme 802.11d 802.11h rm cqa cac dualband ampdu ampdu_tx ampdu_rx amsdurx radio_pwrsave btamp p2p proptxstatus mchan p2po anqpo vht-prop-rates dfrts txpwrcache stbc-tx stbc-rx-1ss epno pfnx wnm bsstrans mfp sae idauth ]
[  395.225893] brcmfmac: brcmf_feat_firmware_capabilities enabling feature: MCHAN
[  395.226445] brcmfmac: brcmf_feat_firmware_capabilities enabling feature: P2P
[  395.227031] brcmfmac: brcmf_feat_firmware_capabilities enabling feature: DOT11H
[  395.227592] brcmfmac: brcmf_feat_firmware_capabilities enabling feature: SAE
[  395.228111] brcmfmac: brcmf_feat_firmware_capabilities enabling feature: FWAUTH
[  395.229482] brcmfmac: brcmf_feat_iovar_int_get enabling feature: PNO
[  395.231822] brcmfmac: brcmf_feat_iovar_int_get enabling feature: MFP
[  395.232783] brcmfmac: brcmf_feat_iovar_int_get enabling feature: DUMP_OBSS
[  395.233827] brcmfmac: brcmf_feat_iovar_int_get enabling feature: EVENT_MSGS_EXT
[  395.235570] brcmfmac: brcmf_feat_iovar_int_get enabling feature: FWSUP
[  395.240819] brcmfmac: brcmf_fws_attach FWS queueing will be avoided
[  395.241859] brcmfmac: brcmf_cfg80211_attach Registering custom regulatory
[  395.246547] brcmfmac: brcmf_setup_wiphybands nmode=1, vhtmode=1, bw_cap=(1, 7, 0), he_enable=255
[  395.247565] brcmfmac: brcmf_setup_wiphybands nrxchain=1
[  395.249084] brcmfmac: brcmf_setup_wiphybands ntxchain=1
[  395.264847] brcmfmac: brcmf_enable_bw40_2g Check bw_cap support:0
[  395.266100] brcmfmac: brcmf_enable_bw40_2g set bw_cap support:0
[  395.287615] brcmfmac: brcmf_add_if netdev:wlan%d ignore IF event
[  395.296599] brcmfmac: check_vif_up device is not ready : status (0)
[  395.297460] brcmfmac: brcmf_net_attach wlan0: Broadcom Dongle Host Driver
[  395.465283] brcmfmac: check_vif_up device is not ready : status (0)
[  395.519938] brcmfmac: check_vif_up device is not ready : status (0)
[  395.520985] brcmfmac: check_vif_up device is not ready : status (0)
[  395.522835] brcmfmac: check_vif_up device is not ready : status (0)
[  395.523975] brcmfmac: check_vif_up device is not ready : status (0)
[  395.526957] brcmfmac: check_vif_up device is not ready : status (0)
[  395.528813] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  395.530098] brcmfmac: brcmf_config_dongle power save set to enabled
[  395.531130] brcmfmac: brcmf_dongle_roam Internal Roaming = On
[  395.532668] ieee80211 phy1: brcmf_dongle_roam: WLC_SET_ROAM_DELTA error (-52)
[  395.533460] brcmfmac: brcmf_cfg80211_change_iface IF Type = Infra
[  395.535500] brcmfmac: brcmf_cfg80211_set_power_mgmt power save enabled
[  395.570081] brcmfmac: brcmf_p2p_add_vif adding vif "p2p-dev-wlan0" (type=10)
[  395.595209] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  395.598514] brcmfmac: brcmf_add_if allocate non-netdev interface
[  395.599744] brcmfmac: check_vif_up device is not ready : status (0)
[  395.600225] brcmfmac: check_vif_up device is not ready : status (0)
[  395.627472] brcmfmac: check_vif_up device is not ready : status (0)
[  395.628569] brcmfmac: check_vif_up device is not ready : status (0)
[  395.629105] brcmfmac: check_vif_up device is not ready : status (0)
[  395.629691] brcmfmac: check_vif_up device is not ready : status (0)
[  395.631412] brcmfmac: check_vif_up device is not ready : status (0)
[  395.632404] brcmfmac: check_vif_up device is not ready : status (0)
[  396.651790] brcmfmac: brcmf_set_mpc MPC : 0
[  396.652858] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  396.756760] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 1: survey duration 80
[  396.757455] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(31) rx(25) tx(0)
[  396.759360] brcmfmac: brcmf_set_mpc MPC : 1
[  396.763106] brcmfmac: brcmf_set_mpc MPC : 0
[  396.764322] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  396.866778] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 2: survey duration 80
[  396.867473] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(14) rx(7) tx(0)
[  396.868935] brcmfmac: brcmf_set_mpc MPC : 1
[  396.872837] brcmfmac: brcmf_set_mpc MPC : 0
[  396.873905] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  396.971803] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 3: survey duration 80
[  396.972495] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(11) rx(5) tx(0)
[  396.973963] brcmfmac: brcmf_set_mpc MPC : 1
[  396.977621] brcmfmac: brcmf_set_mpc MPC : 0
[  396.978619] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.084264] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 4: survey duration 80
[  397.084954] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(4) rx(3) tx(0)
[  397.086392] brcmfmac: brcmf_set_mpc MPC : 1
[  397.089731] brcmfmac: brcmf_set_mpc MPC : 0
[  397.090957] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.194820] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 5: survey duration 80
[  397.195513] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(8) rx(7) tx(0)
[  397.196873] brcmfmac: brcmf_set_mpc MPC : 1
[  397.200779] brcmfmac: brcmf_set_mpc MPC : 0
[  397.201915] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.298786] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 6: survey duration 80
[  397.299477] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(5) rx(5) tx(0)
[  397.300932] brcmfmac: brcmf_set_mpc MPC : 1
[  397.304839] brcmfmac: brcmf_set_mpc MPC : 0
[  397.307116] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.410824] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 7: survey duration 80
[  397.411515] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(4) rx(2) tx(0)
[  397.412972] brcmfmac: brcmf_set_mpc MPC : 1
[  397.416835] brcmfmac: brcmf_set_mpc MPC : 0
[  397.418507] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.522821] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 8: survey duration 80
[  397.523513] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(5) rx(2) tx(0)
[  397.524976] brcmfmac: brcmf_set_mpc MPC : 1
[  397.528947] brcmfmac: brcmf_set_mpc MPC : 0
[  397.529924] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.626823] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 9: survey duration 80
[  397.627515] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(30) rx(15) tx(0)
[  397.629001] brcmfmac: brcmf_set_mpc MPC : 1
[  397.632953] brcmfmac: brcmf_set_mpc MPC : 0
[  397.634118] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.738904] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 10: survey duration 80
[  397.739596] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(34) rx(15) tx(0)
[  397.741058] brcmfmac: brcmf_set_mpc MPC : 1
[  397.744973] brcmfmac: brcmf_set_mpc MPC : 0
[  397.746708] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.850825] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 11: survey duration 80
[  397.851530] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(45) rx(21) tx(0)
[  397.853005] brcmfmac: brcmf_set_mpc MPC : 1
[  397.859657] brcmfmac: brcmf_set_mpc MPC : 0
[  397.860681] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  397.963804] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 36: survey duration 80
[  397.964509] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  397.966429] brcmfmac: brcmf_set_mpc MPC : 1
[  397.970558] brcmfmac: brcmf_set_mpc MPC : 0
[  397.971318] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.074793] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 40: survey duration 80
[  398.075494] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.076958] brcmfmac: brcmf_set_mpc MPC : 1
[  398.080832] brcmfmac: brcmf_set_mpc MPC : 0
[  398.082119] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.179086] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 44: survey duration 80
[  398.179782] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.182126] brcmfmac: brcmf_set_mpc MPC : 1
[  398.186636] brcmfmac: brcmf_set_mpc MPC : 0
[  398.187770] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.292123] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 48: survey duration 80
[  398.292825] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.294392] brcmfmac: brcmf_set_mpc MPC : 1
[  398.298060] brcmfmac: brcmf_set_mpc MPC : 0
[  398.299283] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.402846] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 149: survey duration 80
[  398.403554] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.405477] brcmfmac: brcmf_set_mpc MPC : 1
[  398.409291] brcmfmac: brcmf_set_mpc MPC : 0
[  398.410433] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.514839] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 153: survey duration 80
[  398.515548] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.516914] brcmfmac: brcmf_set_mpc MPC : 1
[  398.520387] brcmfmac: brcmf_set_mpc MPC : 0
[  398.521771] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.628134] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 157: survey duration 80
[  398.628821] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.631069] brcmfmac: brcmf_set_mpc MPC : 1
[  398.634761] brcmfmac: brcmf_set_mpc MPC : 0
[  398.635905] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.739024] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 161: survey duration 80
[  398.739727] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(4) rx(4) tx(0)
[  398.741168] brcmfmac: brcmf_set_mpc MPC : 1
[  398.745229] brcmfmac: brcmf_set_mpc MPC : 0
[  398.746753] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  398.851882] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 165: survey duration 80
[  398.852588] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  398.854639] brcmfmac: brcmf_set_mpc MPC : 1
[  398.860345] brcmfmac: brcmf_cfg80211_connect ie (00000000536a005e), ie_len (50)
[  398.863858] brcmfmac: brcmf_cfg80211_connect using PSK offload
[  400.197319] brcmfmac: brcmf_set_mpc MPC : 0
[  400.198461] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.298901] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 1: survey duration 80
[  400.299630] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(7) rx(6) tx(0)
[  400.300985] brcmfmac: brcmf_set_mpc MPC : 1
[  400.304425] brcmfmac: brcmf_set_mpc MPC : 0
[  400.305543] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.411746] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 2: survey duration 80
[  400.412482] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(18) rx(2) tx(0)
[  400.414606] brcmfmac: brcmf_set_mpc MPC : 1
[  400.418427] brcmfmac: brcmf_set_mpc MPC : 0
[  400.419640] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.522997] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 3: survey duration 80
[  400.523724] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(6) rx(1) tx(0)
[  400.525009] brcmfmac: brcmf_set_mpc MPC : 1
[  400.528599] brcmfmac: brcmf_set_mpc MPC : 0
[  400.529467] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.634380] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 4: survey duration 80
[  400.635067] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(10) rx(5) tx(0)
[  400.636497] brcmfmac: brcmf_set_mpc MPC : 1
[  400.640096] brcmfmac: brcmf_set_mpc MPC : 0
[  400.641317] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.739354] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 5: survey duration 80
[  400.740042] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(14) rx(8) tx(0)
[  400.741489] brcmfmac: brcmf_set_mpc MPC : 1
[  400.746357] brcmfmac: brcmf_set_mpc MPC : 0
[  400.748176] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.851630] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 6: survey duration 80
[  400.852370] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(7) rx(4) tx(0)
[  400.853441] brcmfmac: brcmf_set_mpc MPC : 1
[  400.856617] brcmfmac: brcmf_set_mpc MPC : 0
[  400.857521] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  400.963840] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 7: survey duration 80
[  400.964537] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(16) rx(3) tx(0)
[  400.966451] brcmfmac: brcmf_set_mpc MPC : 1
[  400.970051] brcmfmac: brcmf_set_mpc MPC : 0
[  400.971301] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.074866] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 8: survey duration 80
[  401.075562] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(11) rx(4) tx(0)
[  401.077027] brcmfmac: brcmf_set_mpc MPC : 1
[  401.080886] brcmfmac: brcmf_set_mpc MPC : 0
[  401.083207] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.187275] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 9: survey duration 80
[  401.187920] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(26) rx(14) tx(0)
[  401.190161] brcmfmac: brcmf_set_mpc MPC : 1
[  401.194421] brcmfmac: brcmf_set_mpc MPC : 0
[  401.195866] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.299885] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 10: survey duration 80
[  401.300587] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(35) rx(15) tx(0)
[  401.302060] brcmfmac: brcmf_set_mpc MPC : 1
[  401.306285] brcmfmac: brcmf_set_mpc MPC : 0
[  401.308198] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.410857] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 11: survey duration 80
[  401.411557] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(45) rx(23) tx(0)
[  401.413040] brcmfmac: brcmf_set_mpc MPC : 1
[  401.419702] brcmfmac: brcmf_set_mpc MPC : 0
[  401.420735] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.523854] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 36: survey duration 80
[  401.524557] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  401.526083] brcmfmac: brcmf_set_mpc MPC : 1
[  401.530830] brcmfmac: brcmf_set_mpc MPC : 0
[  401.532774] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.635001] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 40: survey duration 80
[  401.635692] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  401.637607] brcmfmac: brcmf_set_mpc MPC : 1
[  401.641687] brcmfmac: brcmf_set_mpc MPC : 0
[  401.642380] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.746908] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 44: survey duration 80
[  401.747608] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  401.748978] brcmfmac: brcmf_set_mpc MPC : 1
[  401.752979] brcmfmac: brcmf_set_mpc MPC : 0
[  401.753965] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.850877] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 48: survey duration 80
[  401.851580] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  401.853056] brcmfmac: brcmf_set_mpc MPC : 1
[  401.856971] brcmfmac: brcmf_set_mpc MPC : 0
[  401.857750] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  401.962855] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 149: survey duration 80
[  401.963563] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  401.964933] brcmfmac: brcmf_set_mpc MPC : 1
[  401.969210] brcmfmac: brcmf_set_mpc MPC : 0
[  401.970004] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  402.066718] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 153: survey duration 80
[  402.067424] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  402.069220] brcmfmac: brcmf_set_mpc MPC : 1
[  402.073109] brcmfmac: brcmf_set_mpc MPC : 0
[  402.074007] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  402.179863] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 157: survey duration 80
[  402.180575] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  402.182099] brcmfmac: brcmf_set_mpc MPC : 1
[  402.186595] brcmfmac: brcmf_set_mpc MPC : 0
[  402.188587] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  402.290891] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 161: survey duration 80
[  402.291601] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(4) rx(3) tx(0)
[  402.293528] brcmfmac: brcmf_set_mpc MPC : 1
[  402.297351] brcmfmac: brcmf_set_mpc MPC : 0
[  402.299501] brcmfmac: brcmf_add_if netdev:wlan0 ignore IF event
[  402.402844] brcmfmac: brcmf_cfg80211_dump_survey OBSS dump: channel 165: survey duration 80
[  402.403548] brcmfmac: brcmf_cfg80211_dump_survey noise(0) busy(80) rx(0) tx(0)
[  402.404979] brcmfmac: brcmf_set_mpc MPC : 1
[  402.410096] brcmfmac: brcmf_cfg80211_connect ie (0000000022a18edb), ie_len (50)
[  402.415897] brcmfmac: brcmf_cfg80211_connect using PSK offload

--sRDlzrqLmOBKA44t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="brcmfmac-iw-list-upstream.txt"

Wiphy phy0
	wiphy index: 0
	max # scan SSIDs: 10
	max scan IEs length: 2048 bytes
	max # sched scan SSIDs: 16
	max # match sets: 16
	Retry short limit: 7
	Retry long limit: 4
	Coverage class: 0 (up to 0m)
	Device supports roaming.
	Supported Ciphers:
		* WEP40 (00-0f-ac:1)
		* WEP104 (00-0f-ac:5)
		* TKIP (00-0f-ac:2)
		* CCMP-128 (00-0f-ac:4)
		* CMAC (00-0f-ac:6)
	Available Antennas: TX 0 RX 0
	Supported interface modes:
		 * IBSS
		 * managed
		 * AP
		 * P2P-client
		 * P2P-GO
		 * P2P-device
	Band 1:
		Capabilities: 0x1022
			HT20/HT40
			Static SM Power Save
			RX HT20 SGI
			No RX STBC
			Max AMSDU length: 3839 bytes
			DSSS/CCK HT40
		Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
		Minimum RX AMPDU time spacing: 16 usec (0x07)
		HT TX/RX MCS rate indexes supported: 0-7
		Bitrates (non-HT):
			* 1.0 Mbps
			* 2.0 Mbps (short preamble supported)
			* 5.5 Mbps (short preamble supported)
			* 11.0 Mbps (short preamble supported)
			* 6.0 Mbps
			* 9.0 Mbps
			* 12.0 Mbps
			* 18.0 Mbps
			* 24.0 Mbps
			* 36.0 Mbps
			* 48.0 Mbps
			* 54.0 Mbps
		Frequencies:
			* 2412 MHz [1] (20.0 dBm)
			* 2417 MHz [2] (20.0 dBm)
			* 2422 MHz [3] (20.0 dBm)
			* 2427 MHz [4] (20.0 dBm)
			* 2432 MHz [5] (20.0 dBm)
			* 2437 MHz [6] (20.0 dBm)
			* 2442 MHz [7] (20.0 dBm)
			* 2447 MHz [8] (20.0 dBm)
			* 2452 MHz [9] (20.0 dBm)
			* 2457 MHz [10] (20.0 dBm)
			* 2462 MHz [11] (20.0 dBm)
			* 2467 MHz [12] (20.0 dBm)
			* 2472 MHz [13] (20.0 dBm)
			* 2484 MHz [14] (20.0 dBm)
	Band 2:
		Capabilities: 0x1062
			HT20/HT40
			Static SM Power Save
			RX HT20 SGI
			RX HT40 SGI
			No RX STBC
			Max AMSDU length: 3839 bytes
			DSSS/CCK HT40
		Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
		Minimum RX AMPDU time spacing: 16 usec (0x07)
		HT TX/RX MCS rate indexes supported: 0-7
		VHT Capabilities (0x00001020):
			Max MPDU length: 3895
			Supported Channel Width: neither 160 nor 80+80
			short GI (80 MHz)
			SU Beamformee
		VHT RX MCS set:
			1 streams: MCS 0-9
			2 streams: not supported
			3 streams: not supported
			4 streams: not supported
			5 streams: not supported
			6 streams: not supported
			7 streams: not supported
			8 streams: not supported
		VHT RX highest supported: 0 Mbps
		VHT TX MCS set:
			1 streams: MCS 0-9
			2 streams: not supported
			3 streams: not supported
			4 streams: not supported
			5 streams: not supported
			6 streams: not supported
			7 streams: not supported
			8 streams: not supported
		VHT TX highest supported: 0 Mbps
		VHT extended NSS: not supported
		Bitrates (non-HT):
			* 6.0 Mbps
			* 9.0 Mbps
			* 12.0 Mbps
			* 18.0 Mbps
			* 24.0 Mbps
			* 36.0 Mbps
			* 48.0 Mbps
			* 54.0 Mbps
		Frequencies:
			* 5170 MHz [34] (20.0 dBm)
			* 5180 MHz [36] (20.0 dBm)
			* 5190 MHz [38] (20.0 dBm)
			* 5200 MHz [40] (20.0 dBm)
			* 5210 MHz [42] (20.0 dBm)
			* 5220 MHz [44] (20.0 dBm)
			* 5230 MHz [46] (20.0 dBm)
			* 5240 MHz [48] (20.0 dBm)
			* 5260 MHz [52] (20.0 dBm)
			* 5280 MHz [56] (20.0 dBm)
			* 5300 MHz [60] (20.0 dBm)
			* 5320 MHz [64] (20.0 dBm)
			* 5500 MHz [100] (20.0 dBm)
			* 5520 MHz [104] (20.0 dBm)
			* 5540 MHz [108] (20.0 dBm)
			* 5560 MHz [112] (20.0 dBm)
			* 5580 MHz [116] (20.0 dBm)
			* 5600 MHz [120] (20.0 dBm)
			* 5620 MHz [124] (20.0 dBm)
			* 5640 MHz [128] (20.0 dBm)
			* 5660 MHz [132] (20.0 dBm)
			* 5680 MHz [136] (20.0 dBm)
			* 5700 MHz [140] (20.0 dBm)
			* 5720 MHz [144] (20.0 dBm)
			* 5745 MHz [149] (20.0 dBm)
			* 5765 MHz [153] (20.0 dBm)
			* 5785 MHz [157] (20.0 dBm)
			* 5805 MHz [161] (20.0 dBm)
			* 5825 MHz [165] (20.0 dBm)
	Supported commands:
		 * new_interface
		 * set_interface
		 * new_key
		 * start_ap
		 * join_ibss
		 * set_pmksa
		 * del_pmksa
		 * flush_pmksa
		 * remain_on_channel
		 * frame
		 * set_wiphy_netns
		 * set_channel
		 * start_sched_scan
		 * start_p2p_device
		 * connect
		 * disconnect
		 * crit_protocol_start
		 * crit_protocol_stop
		 * update_connect_params
	software interface modes (can always be added):
	valid interface combinations:
		 * #{ managed } <= 2, #{ P2P-device } <= 1, #{ P2P-client, P2P-GO } <= 1,
		   total <= 3, #channels <= 2
		 * #{ managed } <= 1, #{ AP } <= 1, #{ P2P-client } <= 1, #{ P2P-device } <= 1,
		   total <= 4, #channels <= 1
	Device supports scan flush.
	Device supports randomizing MAC-addr in sched scans.
	max # scan plans: 1
	max scan plan interval: 508
	max scan plan iterations: 0
	Supported TX frame types:
		 * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
	Supported RX frame types:
		 * managed: 0x40 0xd0
		 * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * P2P-client: 0x40 0xd0
		 * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * P2P-device: 0x40 0xd0
	Supported extended features:
		* [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
		* [ 4WAY_HANDSHAKE_STA_PSK ]: 4-way handshake with PSK in station mode
		* [ 4WAY_HANDSHAKE_STA_1X ]: 4-way handshake with 802.1X in station mode
		* [ DFS_OFFLOAD ]: DFS offload
		* [ SAE_OFFLOAD ]: SAE offload support
		* [ 4WAY_HANDSHAKE_AP_PSK ]: AP mode PSK offload support
		* [ SAE_OFFLOAD_AP ]: AP mode SAE authentication offload support

--sRDlzrqLmOBKA44t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="brcmfmac-iw-list-dberlin.txt"

Wiphy phy1
	wiphy index: 1
	max # scan SSIDs: 10
	max scan IEs length: 2048 bytes
	max # sched scan SSIDs: 16
	max # match sets: 16
	Retry short limit: 7
	Retry long limit: 4
	Coverage class: 0 (up to 0m)
	Device supports roaming.
	Supported Ciphers:
		* WEP40 (00-0f-ac:1)
		* WEP104 (00-0f-ac:5)
		* TKIP (00-0f-ac:2)
		* CCMP-128 (00-0f-ac:4)
		* CCMP-256 (00-0f-ac:10)
		* GCMP-128 (00-0f-ac:8)
		* GCMP-256 (00-0f-ac:9)
		* CMAC (00-0f-ac:6)
		* CMAC-256 (00-0f-ac:13)
		* GMAC-128 (00-0f-ac:11)
		* GMAC-256 (00-0f-ac:12)
	Available Antennas: TX 0x1 RX 0x1
	Supported interface modes:
		 * IBSS
		 * managed
		 * AP
		 * P2P-client
		 * P2P-GO
		 * P2P-device
	Band 1:
		Capabilities: 0x1022
			HT20/HT40
			Static SM Power Save
			RX HT20 SGI
			No RX STBC
			Max AMSDU length: 3839 bytes
			DSSS/CCK HT40
		Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
		Minimum RX AMPDU time spacing: 16 usec (0x07)
		HT TX/RX MCS rate indexes supported: 0-7
		HE Iftypes: managed
			HE MAC Capabilities (0x0c074a180040):
				+HTC HE Supported
				TWT Requester
				TWT Responder
				Trigger Frame MAC Padding Duration: 3
				BSR
				Broadcast TWT
				OM Control
				Maximum A-MPDU Length Exponent: 1
				Flexible TWT Scheduling
				A-MSDU in A-MPDU
			HE PHY Capabilities: (0x0e20c29e7dc1bf0c0f3c00):
				HE40/2.4GHz
				HE40/HE80/5GHz
				HE160/5GHz
				LDPC Coding in Payload
				NDP with 4x HE-LTF and 3.2us GI
				Full Bandwidth UL MU-MIMO
				Partial Bandwidth UL MU-MIMO
				DCM Max Constellation: 2
				DCM Max NSS Tx: 1
				DCM Max Constellation Rx: 3
				SU Beamformer
				SU Beamformee
				Beamformee STS <= 80Mhz: 7
				Beamformee STS > 80Mhz: 3
				Sounding Dimensions <= 80Mhz: 1
				Ng = 16 SU Feedback
				Ng = 16 MU Feedback
				Codebook Size SU Feedback
				Codebook Size MU Feedback
				Triggered SU Beamforming Feedback
				Triggered MU Beamforming Feedback
				Triggered CQI Feedback
				Partial Bandwidth Extended Range
				PPE Threshold Present
				HE SU PPDU & HE PPDU 4x HE-LTF 0.8us GI
				Max NC: 1
				HE ER SU PPDU 4x HE-LTF 0.8us GI
				20MHz in 40MHz HE PPDU 2.4GHz
				20MHz in 160/80+80MHz HE PPDU
				80MHz in 160/80+80MHz HE PPDU
				TX 1024-QAM
				RX 1024-QAM
				RX Full BW SU Using HE MU PPDU with Compression SIGB
				RX Full BW SU Using HE MU PPDU with Non-Compression SIGB
			HE RX MCS and NSS set <= 80 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE TX MCS and NSS set <= 80 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE RX MCS and NSS set 160 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE TX MCS and NSS set 160 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			PPE Threshold 
		EHT Iftypes: managed
			EHT MAC Capabilities (0x0000):
			EHT PHY Capabilities: (0x0000000000000000):
			EHT MCS/NSS: (0x):
			EHT bw <= 80 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
			EHT bw <= 80 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
			EHT bw <= 80 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
		Bitrates (non-HT):
			* 1.0 Mbps
			* 2.0 Mbps (short preamble supported)
			* 5.5 Mbps (short preamble supported)
			* 11.0 Mbps (short preamble supported)
			* 6.0 Mbps
			* 9.0 Mbps
			* 12.0 Mbps
			* 18.0 Mbps
			* 24.0 Mbps
			* 36.0 Mbps
			* 48.0 Mbps
			* 54.0 Mbps
		Frequencies:
			* 2412 MHz [1] (30.0 dBm)
			* 2417 MHz [2] (30.0 dBm)
			* 2422 MHz [3] (30.0 dBm)
			* 2427 MHz [4] (30.0 dBm)
			* 2432 MHz [5] (30.0 dBm)
			* 2437 MHz [6] (30.0 dBm)
			* 2442 MHz [7] (30.0 dBm)
			* 2447 MHz [8] (30.0 dBm)
			* 2452 MHz [9] (30.0 dBm)
			* 2457 MHz [10] (30.0 dBm)
			* 2462 MHz [11] (30.0 dBm)
			* 2467 MHz [12] (disabled)
			* 2472 MHz [13] (disabled)
			* 2484 MHz [14] (disabled)
	Band 2:
		Capabilities: 0x1062
			HT20/HT40
			Static SM Power Save
			RX HT20 SGI
			RX HT40 SGI
			No RX STBC
			Max AMSDU length: 3839 bytes
			DSSS/CCK HT40
		Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
		Minimum RX AMPDU time spacing: 16 usec (0x07)
		HT TX/RX MCS rate indexes supported: 0-7
		VHT Capabilities (0x33801030):
			Max MPDU length: 3895
			Supported Channel Width: neither 160 nor 80+80
			RX LDPC
			short GI (80 MHz)
			SU Beamformee
			RX antenna pattern consistency
			TX antenna pattern consistency
		VHT RX MCS set:
			1 streams: MCS 0-9
			2 streams: not supported
			3 streams: not supported
			4 streams: not supported
			5 streams: not supported
			6 streams: not supported
			7 streams: not supported
			8 streams: not supported
		VHT RX highest supported: 433 Mbps
		VHT TX MCS set:
			1 streams: MCS 0-9
			2 streams: not supported
			3 streams: not supported
			4 streams: not supported
			5 streams: not supported
			6 streams: not supported
			7 streams: not supported
			8 streams: not supported
		VHT TX highest supported: 433 Mbps
		VHT extended NSS: not supported
		HE Iftypes: managed
			HE MAC Capabilities (0x0c074a180040):
				+HTC HE Supported
				TWT Requester
				TWT Responder
				Trigger Frame MAC Padding Duration: 3
				BSR
				Broadcast TWT
				OM Control
				Maximum A-MPDU Length Exponent: 1
				Flexible TWT Scheduling
				A-MSDU in A-MPDU
			HE PHY Capabilities: (0x0e20c29e7dc1bf0c0f3c00):
				HE40/2.4GHz
				HE40/HE80/5GHz
				HE160/5GHz
				LDPC Coding in Payload
				NDP with 4x HE-LTF and 3.2us GI
				Full Bandwidth UL MU-MIMO
				Partial Bandwidth UL MU-MIMO
				DCM Max Constellation: 2
				DCM Max NSS Tx: 1
				DCM Max Constellation Rx: 3
				SU Beamformer
				SU Beamformee
				Beamformee STS <= 80Mhz: 7
				Beamformee STS > 80Mhz: 3
				Sounding Dimensions <= 80Mhz: 1
				Ng = 16 SU Feedback
				Ng = 16 MU Feedback
				Codebook Size SU Feedback
				Codebook Size MU Feedback
				Triggered SU Beamforming Feedback
				Triggered MU Beamforming Feedback
				Triggered CQI Feedback
				Partial Bandwidth Extended Range
				PPE Threshold Present
				HE SU PPDU & HE PPDU 4x HE-LTF 0.8us GI
				Max NC: 1
				HE ER SU PPDU 4x HE-LTF 0.8us GI
				20MHz in 40MHz HE PPDU 2.4GHz
				20MHz in 160/80+80MHz HE PPDU
				80MHz in 160/80+80MHz HE PPDU
				TX 1024-QAM
				RX 1024-QAM
				RX Full BW SU Using HE MU PPDU with Compression SIGB
				RX Full BW SU Using HE MU PPDU with Non-Compression SIGB
			HE RX MCS and NSS set <= 80 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE TX MCS and NSS set <= 80 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE RX MCS and NSS set 160 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			HE TX MCS and NSS set 160 MHz
				1 streams: MCS 0-11
				2 streams: MCS 0-11
				3 streams: not supported
				4 streams: not supported
				5 streams: not supported
				6 streams: not supported
				7 streams: not supported
				8 streams: not supported
			PPE Threshold 
		EHT Iftypes: managed
			EHT MAC Capabilities (0x0000):
			EHT PHY Capabilities: (0x0000000000000000):
			EHT MCS/NSS: (0x):
			EHT bw <= 80 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
			EHT bw <= 80 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
			EHT bw <= 80 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
			EHT bw=160 MHz, max NSS for MCS 12-13: Rx=0, Tx=0
		Bitrates (non-HT):
			* 6.0 Mbps
			* 9.0 Mbps
			* 12.0 Mbps
			* 18.0 Mbps
			* 24.0 Mbps
			* 36.0 Mbps
			* 48.0 Mbps
			* 54.0 Mbps
		Frequencies:
			* 5170 MHz [34] (disabled)
			* 5180 MHz [36] (30.0 dBm)
			* 5190 MHz [38] (disabled)
			* 5200 MHz [40] (30.0 dBm)
			* 5210 MHz [42] (disabled)
			* 5220 MHz [44] (30.0 dBm)
			* 5230 MHz [46] (disabled)
			* 5240 MHz [48] (30.0 dBm)
			* 5260 MHz [52] (disabled)
			* 5280 MHz [56] (disabled)
			* 5300 MHz [60] (disabled)
			* 5320 MHz [64] (disabled)
			* 5500 MHz [100] (disabled)
			* 5520 MHz [104] (disabled)
			* 5540 MHz [108] (disabled)
			* 5560 MHz [112] (disabled)
			* 5580 MHz [116] (disabled)
			* 5600 MHz [120] (disabled)
			* 5620 MHz [124] (disabled)
			* 5640 MHz [128] (disabled)
			* 5660 MHz [132] (disabled)
			* 5680 MHz [136] (disabled)
			* 5700 MHz [140] (disabled)
			* 5720 MHz [144] (disabled)
			* 5745 MHz [149] (30.0 dBm)
			* 5765 MHz [153] (30.0 dBm)
			* 5785 MHz [157] (30.0 dBm)
			* 5805 MHz [161] (30.0 dBm)
			* 5825 MHz [165] (30.0 dBm)
	Supported commands:
		 * new_interface
		 * set_interface
		 * new_key
		 * start_ap
		 * join_ibss
		 * set_pmksa
		 * del_pmksa
		 * flush_pmksa
		 * remain_on_channel
		 * frame
		 * set_wiphy_netns
		 * set_channel
		 * start_sched_scan
		 * start_p2p_device
		 * connect
		 * disconnect
		 * crit_protocol_start
		 * crit_protocol_stop
		 * update_connect_params
	software interface modes (can always be added):
	valid interface combinations:
		 * #{ managed } <= 2, #{ P2P-device } <= 1, #{ P2P-client, P2P-GO } <= 1,
		   total <= 3, #channels <= 2
		 * #{ managed } <= 1, #{ AP } <= 1, #{ P2P-client } <= 1, #{ P2P-device } <= 1,
		   total <= 4, #channels <= 1
	Device supports low priority scan.
	Device supports scan flush.
	Device supports randomizing MAC-addr in sched scans.
	max # scan plans: 1
	max scan plan interval: 508
	max scan plan iterations: 0
	Supported TX frame types:
		 * managed: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * AP: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-client: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-GO: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
		 * P2P-device: 0x00 0x10 0x20 0x30 0x40 0x50 0x60 0x70 0x80 0x90 0xa0 0xb0 0xc0 0xd0 0xe0 0xf0
	Supported RX frame types:
		 * managed: 0x40 0xd0
		 * AP: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * P2P-client: 0x40 0xd0
		 * P2P-GO: 0x00 0x20 0x40 0xa0 0xb0 0xc0 0xd0
		 * P2P-device: 0x40 0xd0
	Supported extended features:
		* [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
		* [ 4WAY_HANDSHAKE_STA_PSK ]: 4-way handshake with PSK in station mode
		* [ 4WAY_HANDSHAKE_STA_1X ]: 4-way handshake with 802.1X in station mode
		* [ LOW_SPAN_SCAN ]: low span scan
		* [ LOW_POWER_SCAN ]: low power scan
		* [ HIGH_ACCURACY_SCAN ]: high accuracy scan
		* [ DFS_OFFLOAD ]: DFS offload
		* [ SAE_OFFLOAD ]: SAE offload support
		* [ 4WAY_HANDSHAKE_AP_PSK ]: AP mode PSK offload support
		* [ SAE_OFFLOAD_AP ]: AP mode SAE authentication offload support

--sRDlzrqLmOBKA44t--
