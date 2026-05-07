Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3214B3ACA6C
	for <asahi@lists.linux.dev>; Thu,  7 May 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171873; cv=none; b=izRC1OKKDSCie9uyjuhQzZRxB6uGXED1MylWVDqYghtudHMrSdezHtmS5q1V7TV2ddFSXmPYl7yKxAmGzWLaO3ZTbdaknvwYOgsY81XvHNEIfHheTFQFKE2SnIS7p/0XSmQdiIQ0phv8PdaML/kcQ1GqthsXUCd/tdQWl27QvXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171873; c=relaxed/simple;
	bh=LgRf70lT96wFO857GUhZpj1XP/ybMQwFCMTG3W98hCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5HNoWwTlb/omp25iUEX7KzQcuNU5csK+K6txpsIOGjHT0Om00Z04Ikm8mttp+18UEOZl2vSSMDRusXxoVvDkhvMP80Dj6FiuEUofMjvQzCQ2LdfewgdszomijVzsHxjb+wIlRnj6AqX4Cz9YsMbRc+It9l/fSaO/MkxL33nYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCmvHcZJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCmvHcZJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so9365905e9.1
        for <asahi@lists.linux.dev>; Thu, 07 May 2026 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171871; x=1778776671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGCU5B8lEdAiwWeUe+DGhLUkoxpExSxBEl0W5p2Dn8g=;
        b=CCmvHcZJN5kFmnYwI8ySaG5kqJFy8cw9BWsWz1mi60nlQXq3D2pQ8NJhxAlgEQNYum
         lwIdmXbm2t+s2Zbl/jDI4vbl8ligwUnKQ5f5iUQHgkVWGXUa/AGNIL4QULC9EZ+Md2rm
         mw1TP43zKM6MlJktyX6UgJYI+5IbF7ZuUNyzZvrWn2UMq1kAXTbL+OmEdA7NzE6Srbue
         +TIHpB1L5oUGDleJTkKl4Futa+rXZ0dqwaEZ8bmxeBx6NjdFEV+Wusy1GCJl1ZHWfI0n
         bG1yOeRT7U7qql5pUnfsX03gHYlXaESjK3qK2ZIqkQNe6niX27ElqgfRBRDVcEP9t+PO
         /oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171871; x=1778776671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGCU5B8lEdAiwWeUe+DGhLUkoxpExSxBEl0W5p2Dn8g=;
        b=oCfVWeR2Bomc3UyVOzcLR4RHjF7aCkdWjskyStF0q5ZYNaqiwHT1h5ffBXtuOFKJLZ
         0w/L1GgK2WD8LitaMzjafY32FyQ627kZ1mRZ/j6cbz5eV8MEtr5wOu9+yqqNXOtGHGRG
         lE4vzHJKsIzlrG8Ny6QgyIGgTN6fJqCJ2u/aHU9iVxGsKNjrCUImihGtufFbh40xxXEn
         zeOgRy472strq4mezQUn4PL1dFNQePtPDCtNZqSZaq6FUwGgQ3ruMY+WVg5Zj4lmUsKP
         010zYb6gtirP++qvJrbOUONUcm1m1M/577olPLyGs5KYI1wWtbW6ewsOTFKnNPMYdcC4
         jJtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QTwPVvl9pxaG8UrUlkn9H2l6qHc/MS/EFr6GcnlDDPPWrLP50gOPG7VoCOSKm7bFbFUgILQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUok/yWG+foECTo7JuglNDOwor15Q6DNLTXCsV8/ucR9381zJW
	WEdV7fY5J7gkxw1JZH6O1UG7OH+heHxuYbwt5IwuwW2RMMQEIV+T9mYeJzjFTBiUgIw=
X-Gm-Gg: AeBDiev+/uIUb9wdNwsuSCcRlHQTa4JA9BJP5mBPrm/XfUTYU/pmu9/xjK0/7FJJ3/5
	wh0TdVF+BxpFwW1JUKDAb2DOLjw/gpufWN4Ic7W0ke44DRIUOR8aY0J94/eUnjexR3jHlu73tGj
	AILr/RJqgXYujfbZ+NIQ2lF+0EoA5xPuwk37k7vDFp9zq4VfrrwetilV4UzfdlljTk/EROIVXuw
	vxoaQB9y3FDhmi7vRQ9ehNsATkfO0Ulsv8McRpiLCY9xvcQYbpMsroBzMieQU7IP+WWTTdZClsn
	03wHn+AmLuizyXvq3m1kyX3tm4daP9PBSZmtywib9Trqxoeb/xXCkj9YdRWbpnx8+UE4UFYtC0o
	Dirtp5ZCjrvN3IZVVRShJpzeiWK8/knYaM5vkvvhl8Sv9KvBTUyLZhjkYaX7Jw/jMH9kGcnHCQK
	4tn1dhzDCuB3IOssVwnYEeFVV8rXe0jeWF66E8Y++GitMCsZYE9vag2Q+IkvfAXmfBSveTAZmPN
	MLa+3n5fvIkR3+gIerkYQ==
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e51f4835dmr101988665e9.26.1778171870182;
        Thu, 07 May 2026 09:37:50 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6428e746sm590165e9.0.2026.05.07.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 09:37:49 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	marcan@marcan.st,
	p.zabel@pengutronix.de
Cc: olteanv@gmail.com,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] phy: apple: atc: Fix typec switch/mux leak on unbind
Date: Thu,  7 May 2026 17:37:46 +0100
Message-ID: <20260507163746.108086-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
returned by typec_switch_register() and typec_mux_register(). The
platform driver has no .remove callback, so when the driver unbinds
(e.g. via sysfs unbind) neither typec_switch_unregister() nor
typec_mux_unregister() is called. The framework reference taken in
typec_switch_register() (device_initialize() + device_add() in
drivers/usb/typec/mux.c) is therefore never dropped and the
typec_switch_dev / typec_mux_dev objects stay live forever, with
their sysfs entries under the typec_mux class also left behind. A
subsequent rebind cannot recreate them with the same fwnode-derived
name.

Save the registered handles and unregister them through
devm_add_action_or_reset() so framework registration is torn down
in step with the driver's other devm-managed state. While here,
drop struct apple_atcphy::sw and ::mux: they were declared with the
consumer-side types (typec_switch *, typec_mux *) instead of the
provider-side types and were never assigned.

Scope of the fix
----------------
This patch fixes the registration leak only. It does not close the
use-after-free window that arises when a consumer that obtained a
reference via fwnode_typec_switch_get() / fwnode_typec_mux_get()
outlives the provider unbind: such consumers keep the underlying
typec_switch_dev / typec_mux_dev alive past device_unregister(),
and a later typec_switch_set() / typec_mux_set() still invokes the
registered atcphy_sw_set() / atcphy_mux_set(), which dereferences
the freed apple_atcphy through typec_{switch,mux}_get_drvdata().

On Apple Silicon the relevant consumers are the typec port and the
cd321x controller registered by drivers/usb/typec/tipd/core.c.
Cable plug / orientation events and alt-mode transitions trigger
the .set callbacks via:

  tps6598x_interrupt()                 drivers/usb/typec/tipd/core.c
    tps6598x_handle_plug_event()
      tps6598x_connect()/_disconnect()
        typec_set_orientation()        drivers/usb/typec/class.c
          typec_switch_set(port->sw)   drivers/usb/typec/mux.c
            atcphy_sw_set()            drivers/phy/apple/atc.c

  cd321x_update_work()                 drivers/usb/typec/tipd/core.c
    cd321x_typec_update_mode()
      typec_mux_set(cd321x->mux)       drivers/usb/typec/mux.c
        atcphy_mux_set()               drivers/phy/apple/atc.c

Closing that window requires framework support for invalidating
consumer-held references on provider unbind. The same
consumer-survives-provider pattern has been discussed for the PHY
framework [1] and is out of scope here.

[1] https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/

Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/phy/apple/atc.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index e9d106f135c5..4156fabad742 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -628,9 +628,6 @@ struct apple_atcphy {
 
 	struct reset_controller_dev rcdev;
 
-	struct typec_switch *sw;
-	struct typec_mux *mux;
-
 	struct mutex lock;
 };
 
@@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation ori
 	return 0;
 }
 
+static void atcphy_typec_switch_unregister(void *data)
+{
+	typec_switch_unregister(data);
+}
+
 static int atcphy_probe_switch(struct apple_atcphy *atcphy)
 {
+	struct typec_switch_dev *sw;
 	struct typec_switch_desc sw_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_sw_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
+	sw = typec_switch_register(atcphy->dev, &sw_desc);
+	if (IS_ERR(sw))
+		return PTR_ERR(sw);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregister, sw);
 }
 
 static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
@@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *sta
 	return atcphy_configure(atcphy, target_mode);
 }
 
+static void atcphy_typec_mux_unregister(void *data)
+{
+	typec_mux_unregister(data);
+}
+
 static int atcphy_probe_mux(struct apple_atcphy *atcphy)
 {
+	struct typec_mux_dev *mux;
 	struct typec_mux_desc mux_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_mux_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
+	mux = typec_mux_register(atcphy->dev, &mux_desc);
+	if (IS_ERR(mux))
+		return PTR_ERR(mux);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregister, mux);
 }
 
 static int atcphy_load_tunables(struct apple_atcphy *atcphy)
-- 
2.53.0

