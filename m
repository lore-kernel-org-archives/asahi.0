Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CE3A3E8C
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966081; cv=none; b=bi7IkOxVyzlx622nUVOIhV3S7PabwH5bMmz5WhVQH0yHSpEcPVLnZcr6HPPgitp7S3Vt5fXmkn0wyvQdZXGY7Ek+zjqCLgygMtqc2lKkSqcFWhRZ6noEoJATzkRA2Nlm2NjXc9l2GgiucGrNBgxji7t+90tiGRzD3ffmARBMiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966081; c=relaxed/simple;
	bh=f4Crb3c+dv8KnX89knlqIY/7BdSoK+Hx/YKrvclncpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FA3ZKs6osq8DPbzIJGD1JCUNNT3sviGooEnv5S4wIz09IIR/DuYxAs8inn/arXOumKcVDgX50l5XkYby6+EV7VsCxwjRUe+2/B+AH66FWsXNFXYZooxB35eU9CjzqJfsFMS41WNOHg6Izzhxm0z6czb/9wFSG5KfVMcXbWt0RVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cyuQeyQZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cyuQeyQZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so2891724a12.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966078; x=1792570878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8YsVbXOdF61Llj8qBDqVp2Fp9mYBbP2iNpUhV0IltE=;
        b=cyuQeyQZl7rhFOsFLlDeEq/JmvFfm94Jyh9/B+UZaJznAzcxYllxc0UghKhlgL4XKH
         EEvDwugDMNGM1Xld3IS8KgmEPG/PITxyLz3ec7FaEZxBOYjQYeN/+SEmDHFxPq0K5uYs
         Z7aG2xzkCbTqzX0mvxIlgxxXeTRJOSpydkLkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966078; x=1792570878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8YsVbXOdF61Llj8qBDqVp2Fp9mYBbP2iNpUhV0IltE=;
        b=wgh2XgMMS3PrB9kssD//IFFYhRWi2NrpN6XNINxKnJOVw6ydT03O9KaPcirBhnfqOw
         9MNMdeQSz6OtcTgFLlJZ0DVEaIiJ0e7DDz54OkkzY8mp/H3y2tKRFrOjTYbGiCm9RI+n
         inbjC9mtmxyc/ASG+t58XZPOYcddCkhCAN9+APtTXCVD0Gd8HRWNd5g+Y91ZmjIQmcyv
         aSiRhAjZWaDZ2c3rCZpP3SjrPUrf6ZHQOr3ECfJHZjCOK98e2H4CsjpmD1a/4QZvaSEN
         XZB+xJ7Xj+uLSj5qhMpIWFESDDhaHcS8aTEFXy5ksFkr9O6MdZOYeWQJ/pQzGdeNpt5W
         Rq5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpCnXtpsDGrabHB9Pfej1j4mg/H/tixabm+D6PRIyWkhiUCP4hu/i1ila9DSth4Ig2CQoOjA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIBTJ4j+y+6n28hKNwj2Be/O5ijzeNNgJ0eaYdN4ThsSzmrMkeD
	wcOD3AA+Sdd5NzORyIWfvyzZ5Vz8myCeDTUm+Td3bXcqlY6TIDqcRKKPhAp+qtxy2g==
X-Gm-Gg: AYBFou1+LV+rleLHjfDE/cIX2mSj6RcB7WDy3EkNE/FiNNrdaV+Zg0pDEQXOktASkpH
	zeVwLewU+XRs37c3NpK8YRJ08WK6g+Ci/AbcxGdVJLDB9GyzCcUAsv2KZ8bJ6o5T8XoPV0rp8AE
	N4HvUrMONdI86oLIUAJP3hmGfbkiL07hzW6GTNVdB61X8hRqGtMmgxhKfT1ajuwthJR0gjSve7s
	ibaZVXYpTniRm/EpPrtFOGRC3V97SgEzRc9DPvDfiFHuNOu9ndeyGseEoZ7V+yHjkX/WpH51GVB
	kh60hPq7Sjcy4sl9iGr3jKixIGL6G9CB7M9BMh06VKvT3a7dXH/lsCUdkmllVFWZ9GhFGM1C9hY
	QKpQCz3SNDj/nU82fbzRVfIwAY8tBp8aFS+35R4IY7FsGT2yVsCkc+iHqy62bFRLMTxJxKv5b08
	KEF/kS9sqrD5Ob/8CMlBN6GG06aRwcyzJCU3+mKICXP+DvCSLbw6Vkn9lP1MSU0btk3zASVl2N8
	YAcNU1ztyyY+8zSC72QQjKxqb2GYIhqPT7a26QM5+iXuPLZIfa/5lmSVu1kV/VHBPZn
X-Received: by 2002:a17:90b:4a45:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-3ab3a2fe791mr12737876a91.6.1791966077891;
        Wed, 14 Oct 2026 01:21:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/2] dt-bindings: usb: downstream host ports for hcd and dwc3
Date: Wed, 14 Oct 2026 16:20:34 +0800
Message-ID: <20261014082037.1774672-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi folks,

I mentioned to a couple people at LPC that the USB host controller
bindings were missing downstream port definitions, and that the ones
used for dwc3 don't align with USB hardware port numbering.

The dwc3 discrepancy was originally noticed by Wei [1] and Konrad [2]
while adapting my M.2 E-key USB support series [3][4] to Qualcomm devices.

Here are the binding changes. If you were CC-ed, then you were listed as
the maintainer of any one of the dwc3 implementations or platforms using
it. So this change would affect you.

Patch 1 adds the "ports" definitions to the common USB host controller
binding. This just follows what is used in usb-hub.yaml. Nothing
special.

Patch 2 "fixes" the port numbering used in the common dwc3 binding. The
dwc3 includes an XHCI for host mode operation, and its port numbering
should follow the common usb-hcd.yaml binding. This clashes with the
existing arbitrary port numbering found in dwc3. I checked all the
big projects, and it seems that only Linux is using them, and it doesn't
care about the numbering anyway.

So while the patches looks small, there are actually 26 other dwc3
implementation bindings that are affected.

And this series currently only has the binding changes. There are
probably close to 500 dts files that need to be fixed as well. I asked
LLM to help me fix the arm64 ones already, and it seemed to do a good
job with some hand holding.

Please have a look. I fully expect there to be a lot of hair pulling.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260731073306.1895428-1-wei.deng@oss.qualcomm.com/
[2] https://lore.kernel.org/all/c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com/
[3] v6: https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/
[4] v9 (latest): https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/


Chen-Yu Tsai (2):
  dt-bindings: usb: hcd: Add downstream USB ports
  dt-bindings: usb: snps,dwc3: Fix downstream port numbering

 .../devicetree/bindings/usb/snps,dwc3-common.yaml      |  4 ++--
 Documentation/devicetree/bindings/usb/usb-hcd.yaml     | 10 +++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

