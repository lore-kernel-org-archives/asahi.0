Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F52147F9
	for <asahi@lists.linux.dev>; Mon, 20 Apr 2026 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776726641; cv=none; b=EDSvdl3TVp42kpEvEnSMBwGW469C00qUrWxjKk2h3AypGklWczMYjrGrtQ+sv4GjCJZccF6YMS+ea8v+zvJEHxwvDfe7IMdNCBb6Zrww2e33WvqXjJNTs4EF9aDSVB20E8rxN/HecRRF7AoQdIM8Hx/hqUZcqUc7hf5PAWkfJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776726641; c=relaxed/simple;
	bh=tb2JNc5ynwajJeCuTzOWgJ2OezcFfgp4Ywh/smpSH0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I31HNTIVylMbiI257jB/L6s2hVFU2m+q9h5ik8OmIypQJ77/tZi0yxN9YVMvDh5IH7RkJFpEtNcyEOskVXA4A5s1PVEI1HpBxEd7XTT434ZMBHMXJrt9g8O5I8iH17IcOpF7kLvpDDSRXzTUB6dwTIVHWdjsRwWR6BPyH51b+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkv+NB8V; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkv+NB8V"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so3913898f8f.3
        for <asahi@lists.linux.dev>; Mon, 20 Apr 2026 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776726638; x=1777331438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BFbqe6zs9zdE69IPJo3pEdqtjhoEkNZOLj14gX1oP8=;
        b=Gkv+NB8VxCvh1xY0QhlIge7oFWnGmLo/Qagq0wl/ioivG2Fxf5j5b1ehlNJtQHu+j8
         m7UTT8kyg54ZnU6bqhkLq3vZmRQkUk5LuZWsMNpEW8b1+89x4wVExoFuLPsJKQdu9q22
         3l/oRvPx5eeQ0MFs9X/2gyz+VtZBpgKrnXPOd0ZBZo78rCgYlkoxk2/A+7xl0beBHttc
         6NHq6EmlYaIVpvHO2lzK0TbX37um1w2cIPdJht6X79AyvKiOq8rMVQJJZZLKUs78p6D8
         rCl0+mAylZrvym/csqxZssYMQIoNKS60Tlmh5wqTIe9UyVcBphthEUaCKW93Ff7bCxlF
         6AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726638; x=1777331438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BFbqe6zs9zdE69IPJo3pEdqtjhoEkNZOLj14gX1oP8=;
        b=JRmNSh6QBiTY73rAPHnmZncXL+XO5bWJJHXCe3eGs9Tv4uuFWmZ3p55c19cI2fwJd/
         2bMHqjOvfyXuHrJWObX7T7H++DwxVfiQ0Mp+DVq3Wv8hK1YG9ZgfvZuTcXG7GD2RmA+r
         joacrWx3S1aw28/zvWX7Qn/RkyUgU0+6s/RX1DdsW+Cwz3B5l0tIlEbBExvjpEapkCxm
         c2LpKuguDOivPaWZ+tfkB39uvH0x8qZEDlPQAt6FzCG7nJNkThg+b+PCl/WNtVIna+Rn
         pQ34r1FhpZEpK1tgsDXsvn3UyewQFiu5j/hOc97dCBGMXa4Ue920DyoJ5DahHvh+/HVX
         JncA==
X-Forwarded-Encrypted: i=1; AFNElJ+BTEYcrAJiUizETHoX4wrVIZ4T1oulyvhjripfMCYkZ2FKLyuQSD0yLWgLrnTRWUz8tqWyLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5KebUAYJlEErkCzzyQW79vE/uCjDPO5a+ki93fWixo+T/Ifq9
	tD6KR4AfmBuXv+/Xscajb8u/uP+zts3LxeRKhKQQ3KDxDUTEHePRSdvF
X-Gm-Gg: AeBDieunDQ4Ec0ZnJ33q/Jl5r3cmuYu4tPyW4ZzujmHB7RmpDtPbEB4qf+YSTpWK8Ol
	vydqJza0ik+2WyIaOahmmxuW+0x0ovlHTXpZasOL0UTx6cZMrS7SPObdKs85uMrRrnSVg8tgIEx
	XMy9fZNuw5KApJ4WRSMjL78HgMQ3qgXaeJEEgc2IFanvmTws8M5r5pptsA7+rHmp/I9fU0T+21m
	dzw8AFK4nTIXcReqzT/43C7+MVhfbcMS0s5LoMO2GAyDWOizPz+hvkT9vl2bST1yTCNBV5iZOAu
	1d9L+NFSYoKD2MGM1qCRczK/4dtnnjTzF95YOgFnnELcQQQGEfIcrPH86iX/tOX/smrbHb4ISaP
	7cp+kU5IktcF0U0WjRcRzyIOEwedMWOX5GPDjpo2huBgwb4v3ZatZOeiK0AW1xedyir7SenSrzR
	7Rwey2B1vK2bYop4GRBTRcLQvgrzs5rkD0XXyAOIKlz49MFfg10jC+zFtxlcKR/sMCUt28MP1d0
	jEtoa3fl+sCEdcpAFc6WQ==
X-Received: by 2002:a05:6000:1acc:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-43fe3e0c612mr24008948f8f.22.1776726637610;
        Mon, 20 Apr 2026 16:10:37 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm36837571f8f.18.2026.04.20.16.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:10:37 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Carlier <devnexen@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: apple: atc: Fix typec switch/mux leak and UAF on unbind
Date: Tue, 21 Apr 2026 00:10:13 +0100
Message-ID: <20260420231014.35462-1-devnexen@gmail.com>
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
platform driver has no .remove callback, so the registered switch
and mux devices outlive the apple_atcphy struct, which is released
by devm cleanup on driver unbind.

A subsequent typec event (cable orientation change, alt-mode
transition) then invokes the registered atcphy_sw_set() or
atcphy_mux_set() callback, which retrieves the freed apple_atcphy
and dereferences it. Unbind followed by a cable replug or alt-mode
change is enough to trigger the use-after-free.

Save the registered switch and mux and unregister them through
devm_add_action_or_reset() so the framework references disappear in
step with the driver's devm-allocated state. Drop the unused struct
apple_atcphy::sw and ::mux fields, which were declared with the
wrong consumer-side types and never assigned.

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

