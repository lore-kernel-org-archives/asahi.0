Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133163E4C81
	for <asahi@lists.linux.dev>; Fri,  8 May 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271606; cv=none; b=ffczXPNrgzPjhw/WFbAphGL/V6Y57ogSHqCUEYLce3RX9ReSgAKNDy813FEIDJs5Lk4fICAfmocBoDc2ozwtZA6p5h9ZxCQc87W2Rh0R253iGIbWMalISA3rPSETMu+GwBJMMY27IoNYmUNKCYQwt/0LV3YWTeDjj8R2ENXPgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271606; c=relaxed/simple;
	bh=OBFGSiE7H/QhxVXYn15clyP+cvz7m6tk69dlpz2LGLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3Rv6n6F4rBH9Fas2CwRaTVYWQF8uRKpDvkWg8aSuNKykCZkburX7WB3wXgsC98iuKycG3uSrxyH4WgI62CHlvq3tcMLhAQEs7TqcatcFUXCeDByG6F8kSfWW7gur/klNcPOZcZA9l5aWeS2DT79f/CkorCaKt+bunAP9gA5mdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaNp1DWQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaNp1DWQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so26196835e9.2
        for <asahi@lists.linux.dev>; Fri, 08 May 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778271603; x=1778876403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP40aocTsGkB8//cxZMak90EHfdlyQYnHT+ooa5+Bl4=;
        b=TaNp1DWQR5knTgPOX7cXejramu0Osxav7EZRnD6DSIKoQhmu+NEZDbgtcj8gqy5Brs
         TSa+BD/mHcjnxlEZu4m7YkV+oZ0N1FAxppsPcA600Awhyd32xvXirA7fwrbEkLtpD8ma
         EYRuqLjvpnTfERJ/7Mi/NAs3ODHF8C2PrQDFcdWUmnPSgJ/epCtOYUasj4tOk5A7qjgF
         ewDGKn6hkv+I2vlvJNPcqVJHP/NqExb/VyXkEk/ALX8Ml+BFuOCNAe60HtG9up+sqmY2
         tMTyS/YMjMQqfibgKCc70tv/QABOicUSvyICy12X4QIGN8vKd9LFhK2dYQ2tgW/sWj95
         mcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271603; x=1778876403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HP40aocTsGkB8//cxZMak90EHfdlyQYnHT+ooa5+Bl4=;
        b=QYdPxt3CLL7a1DybX8rjpwHhHeYh5/pLoxOpvv0xAmx7ARZsbEfOWLo/q9Sl8wM3vM
         BP/mWMSgh91bzGW9Mco9/S13SUM1Je8T9WCofkZKKtYqHbWBf8wTGko0vOEUS1kKQS0g
         d975uI+6gdnD10+tX8gVWLu6ObuC1FGEl/ITdcUBXllbzi+vowe9WHsy+fJZMRjtyygp
         D2jK99mwjJV4m07q+jOGRx1aSRhON86Cs3LIVyEUE1veQximYjQTxvI6l+9zBhqYDzmX
         KUO0hRCjQlDPKL8IPDUIT0CuUKfk5ucX5lrpozmWetjMPI62QEFFMM6aVw8SMPi2j7jj
         OCIg==
X-Forwarded-Encrypted: i=1; AFNElJ8iJPMJM5g2WLjlgZ2mOxsMaduSpBL0SDj8Ym9B8nxMoUkXIgx7TFQCr68Tftqc3eyCi5fHZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+a9YIo6mfqEzfAskDEok4/KMFXBJ3E6F4MHGih4yEzNw/M+bm
	B6qRvj9VjdGuMAoPTjnzRIyu5GLglXtACh6lY1m5aLkMYxMWsOxaRGVE
X-Gm-Gg: AeBDiesQALiv3j3gGnVe0Xow2HVJhoE/5eZ3jgScP8PDBhsxzKtjWBBFV42HvsgpW9R
	Y9KP5l1T+Yf7nd1H70ZGoTUtd+8Riiz1MfeDIBzkYFAgm60MVXdvG7MJiqcpWDpiAM1lGzs+RLC
	1fyEJfHVD+LgkIGVoZjNgEFiN1j8AJsaF4bVc+2wCsQH6BCNWo1TN3dfhCnGPtpfe3QxMIo/gpt
	vpZu8Cwv19oWsP3YPveG90veLIpZsplDqcEUf+KvuxTiWhhGsOEPzEVXbGiTI40admrTAIsWpy8
	SdVIBw5O/ECB0JCKu/SXcnEwRrdjjmVQ/UAu50sNzYbYQG3I4lHAFcxaqx5T4DWld6QVRNZCAiQ
	rtfI7YQ/6nEaUvz0ix4wRQxqbWJK/L9Sad3ABaPGXVee6GwRi8/LLs3DyioGBqOMrY50oULDHo/
	FQeIQOXvX9tSzgOvGu/2SxQmpycwAGCIGBf2N4QpUn8k5h5qUkIwQ/8nR73twckGSfyo/Iln+Bf
	NN5Gz77sLg=
X-Received: by 2002:a05:600c:3151:b0:48a:7605:751e with SMTP id 5b1f17b1804b1-48e51e0837amr215462255e9.4.1778271603054;
        Fri, 08 May 2026 13:20:03 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd328c2sm15825895e9.6.2026.05.08.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:20:02 -0700 (PDT)
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
Subject: [PATCH v3] phy: apple: atc: Fix typec switch/mux leak on unbind
Date: Fri,  8 May 2026 21:19:58 +0100
Message-ID: <20260508201958.30060-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507163746.108086-1-devnexen@gmail.com>
References: <20260507163746.108086-1-devnexen@gmail.com>
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
================
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
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
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

