Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF99313E2B
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996469; cv=none; b=gr4Qpu8dHFjQcR+2gq5ewOhLtacuprevfx0FPMg96aIw9kMt6/mWWwvV6fuqxKYfY4vq4Vet2DTX/t9so6m9aLyrOvlu7uOCpx6S33mjPFjCyCYVxW2beeH/XJ2jCPXBurT12VqvlOaNXcL7QZtnOYKsuQptw7F+TwdCCIa2Y+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996469; c=relaxed/simple;
	bh=PwPzHTrjgpNblaa5e2P55NH5Jr9PTX53a2PzkbTJiUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPrpAWyRjjxxdhKR2Js1M8WEJRo5IbvCerZEfGwzJ4kktkWE0KAirdxaKfp1qRTmwEZsi1s5TUDaxp6ccCHC7jzEa2JCVASsVd3+VdYlbGoOSbKQcyJ/rUZZH8oFQN2NLFq89I3pcfoaaFGjeqyfjry3wPySEetbLmWxF6Ren68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=kRNSuy0K; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="kRNSuy0K"
Received: by chaosmail.tech (Postfix) id 1D5311C88A2;
	Sat, 25 Jul 2026 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784996465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flq66MJCNjahhJTNoPOoMIAIXVpK7+cnVlGKybVnysE=;
	b=kRNSuy0KocbOilHGHAQuEbiCqeDsWolZri/Et/K0F3cDUajeFCZJi8Ke2gxTAsmObasZuP
	RhdjFuh01E7H8WUXkOquO7elPIIm42J0vGgGqzIXdvMZ51JZHo8PGE6bR+i/tzTuEfottD
	CCEQSkSyShRWUiiAxzND4lAgdY4UPrU=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 18:20:57 +0200
Subject: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
In-Reply-To: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784996463; l=10907;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=rdMerT0n4sVYJJTyANPxYg/7K59i3kRA5QbNRqA1H44=;
 b=YuoJxPln+veOWJBlyjeYNXiHprhcI4xhLPVV7eeH/Z9cvJ0tZy1B3BFuDzqtzqmAtaK0CZFaI
 SaHGNQnWzuZC4Nu/SQ6Qt0XZa41YXJ6Aq2xrztR+obh3n11M1igAX6l
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alyssa Milburn <amilburn@zall.org>

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip

Signed-off-by: Alyssa Milburn <amilburn@zall.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/usb/typec/tipd/Makefile           |   2 +-
 drivers/usb/typec/tipd/{core.c => core.h} | 109 ++++++++++++++++++++++++++++---------------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c              |  86 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+), 82 deletions(-)

diff --git a/drivers/usb/typec/tipd/Makefile b/drivers/usb/typec/tipd/Makefile
index aa439f80a889..ba38daee9e72 100644
--- a/drivers/usb/typec/tipd/Makefile
+++ b/drivers/usb/typec/tipd/Makefile
@@ -2,5 +2,5 @@
 CFLAGS_trace.o			:= -I$(src)
 
 obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
-tps6598x-y			:= core.o
+tps6598x-y			:= i2c.o
 tps6598x-$(CONFIG_TRACING)	+= trace.o
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.h
similarity index 95%
rename from drivers/usb/typec/tipd/core.c
rename to drivers/usb/typec/tipd/core.h
index d5ee0af9058b..1ba29e439e01 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.h
@@ -9,7 +9,6 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
@@ -167,6 +166,7 @@ struct tps6598x {
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex lock; /* device lock */
+	int irq;
 	u8 i2c_protocol:1;
 
 	struct gpio_desc *reset;
@@ -231,6 +231,13 @@ static const char *tps6598x_psy_name_prefix = "tps6598x-source-psy-";
  */
 #define TPS_MAX_LEN	64
 
+static struct tps6598x *tps6598x_from_device(struct device *dev)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	struct tps6598x *tps = i2c_get_clientdata(client);
+	return tps;
+}
+
 static int
 tps6598x_block_read(struct tps6598x *tps, u8 reg, void *val, size_t len)
 {
@@ -1738,27 +1745,13 @@ static void cd321x_remove(struct tps6598x *tps)
 	cancel_delayed_work_sync(&cd321x->update_work);
 }
 
-static int tps6598x_probe(struct i2c_client *client)
+static int tps6598x_probe(struct tps6598x *tps)
 {
-	const struct tipd_data *data;
-	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
 	u32 vid;
 	int ret;
 
-	data = i2c_get_match_data(client);
-	if (!data)
-		return -EINVAL;
-
-	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
-	if (!tps)
-		return -ENOMEM;
-
-	mutex_init(&tps->lock);
-	tps->dev = &client->dev;
-	tps->data = data;
-
 	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(tps->reset))
 		return dev_err_probe(tps->dev, PTR_ERR(tps->reset),
@@ -1766,23 +1759,12 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (tps->reset)
 		msleep(TPS_SETUP_MS);
 
-	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
-	if (IS_ERR(tps->regmap))
-		return PTR_ERR(tps->regmap);
-
 	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
 		if (ret < 0 || !vid)
 			return -ENODEV;
 	}
 
-	/*
-	 * Checking can the adapter handle SMBus protocol. If it can not, the
-	 * driver needs to take care of block reads separately.
-	 */
-	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
-		tps->i2c_protocol = true;
-
 	if (tps->data->switch_power_state) {
 		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
 		if (ret)
@@ -1816,7 +1798,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	 * with existing DT files, we work around this by deleting any
 	 * fwnode_links to/from this fwnode.
 	 */
-	fwnode = device_get_named_child_node(&client->dev, "connector");
+	fwnode = device_get_named_child_node(tps->dev, "connector");
 	if (fwnode)
 		fw_devlink_purge_absent_suppliers(fwnode);
 
@@ -1842,14 +1824,14 @@ static int tps6598x_probe(struct i2c_client *client)
 			goto err_unregister_port;
 		ret = tps->data->connect(tps, status);
 		if (ret)
-			dev_err(&client->dev, "failed to register partner\n");
+			dev_err(tps->dev, "failed to register partner\n");
 	}
 
-	if (client->irq) {
-		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+	if (tps->irq) {
+		ret = devm_request_threaded_irq(tps->dev, tps->irq, NULL,
 						tps->data->irq_handler,
 						IRQF_SHARED | IRQF_ONESHOT,
-						dev_name(&client->dev), tps);
+						dev_name(tps->dev), tps);
 	} else {
 		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
 		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
@@ -1860,13 +1842,12 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (ret)
 		goto err_disconnect;
 
-	i2c_set_clientdata(client, tps);
 	fwnode_handle_put(fwnode);
 
 	tps->wakeup = device_property_read_bool(tps->dev, "wakeup-source");
-	if (tps->wakeup && client->irq) {
-		devm_device_init_wakeup(&client->dev);
-		enable_irq_wake(client->irq);
+	if (tps->wakeup && tps->irq) {
+		devm_device_init_wakeup(tps->dev);
+		enable_irq_wake(tps->irq);
 	}
 
 	return 0;
@@ -1888,14 +1869,12 @@ static int tps6598x_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void tps6598x_remove(struct i2c_client *client)
+static void tps6598x_remove(struct tps6598x *tps)
 {
-	struct tps6598x *tps = i2c_get_clientdata(client);
-
-	if (!client->irq)
+	if (!tps->irq)
 		cancel_delayed_work_sync(&tps->wq_poll);
 	else
-		devm_free_irq(tps->dev, client->irq, tps);
+		devm_free_irq(tps->dev, tps->irq, tps);
 
 	if (tps->data->remove)
 		tps->data->remove(tps);
@@ -1913,17 +1892,16 @@ static void tps6598x_remove(struct i2c_client *client)
 
 static int __maybe_unused tps6598x_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct tps6598x *tps = i2c_get_clientdata(client);
+	struct tps6598x *tps = tps6598x_from_device(dev);
 
 	if (tps->wakeup) {
-		disable_irq(client->irq);
-		enable_irq_wake(client->irq);
+		disable_irq(tps->irq);
+		enable_irq_wake(tps->irq);
 	} else if (tps->reset) {
 		gpiod_set_value_cansleep(tps->reset, 1);
 	}
 
-	if (!client->irq)
+	if (!tps->irq)
 		cancel_delayed_work_sync(&tps->wq_poll);
 
 	return 0;
@@ -1931,8 +1909,7 @@ static int __maybe_unused tps6598x_suspend(struct device *dev)
 
 static int __maybe_unused tps6598x_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct tps6598x *tps = i2c_get_clientdata(client);
+	struct tps6598x *tps = tps6598x_from_device(dev);
 	int ret;
 
 	ret = tps6598x_check_mode(tps);
@@ -1946,14 +1923,14 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 	}
 
 	if (tps->wakeup) {
-		disable_irq_wake(client->irq);
-		enable_irq(client->irq);
+		disable_irq_wake(tps->irq);
+		enable_irq(tps->irq);
 	} else if (tps->reset) {
 		gpiod_set_value_cansleep(tps->reset, 0);
 		msleep(TPS_SETUP_MS);
 	}
 
-	if (!client->irq)
+	if (!tps->irq)
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
 
@@ -2018,33 +1995,3 @@ static const struct tipd_data tps25750_data = {
 	.reset = tps25750_reset,
 	.connect = tps6598x_connect,
 };
-
-static const struct of_device_id tps6598x_of_match[] = {
-	{ .compatible = "ti,tps6598x", &tps6598x_data},
-	{ .compatible = "apple,cd321x", &cd321x_data},
-	{ .compatible = "ti,tps25750", &tps25750_data},
-	{}
-};
-MODULE_DEVICE_TABLE(of, tps6598x_of_match);
-
-static const struct i2c_device_id tps6598x_id[] = {
-	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)&tps6598x_data },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tps6598x_id);
-
-static struct i2c_driver tps6598x_i2c_driver = {
-	.driver = {
-		.name = "tps6598x",
-		.pm = &tps6598x_pm_ops,
-		.of_match_table = tps6598x_of_match,
-	},
-	.probe = tps6598x_probe,
-	.remove = tps6598x_remove,
-	.id_table = tps6598x_id,
-};
-module_i2c_driver(tps6598x_i2c_driver);
-
-MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Driver");
diff --git a/drivers/usb/typec/tipd/i2c.c b/drivers/usb/typec/tipd/i2c.c
new file mode 100644
index 000000000000..0233e19290ea
--- /dev/null
+++ b/drivers/usb/typec/tipd/i2c.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for TI TPS6598x USB Power Delivery controller family
+ *
+ * Copyright (C) 2017, Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/module.h>
+
+#include "core.h"
+
+static int tps6598x_probe_i2c(struct i2c_client *client)
+{
+	const struct tipd_data *data;
+	struct tps6598x *tps;
+	int ret;
+
+	data = i2c_get_match_data(client);
+	if (!data)
+		return -EINVAL;
+
+	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	mutex_init(&tps->lock);
+	tps->dev = &client->dev;
+	tps->data = data;
+	tps->irq = client->irq;
+
+	tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
+	if (IS_ERR(tps->regmap))
+		return PTR_ERR(tps->regmap);
+
+	/*
+	 * Checking can the adapter handle SMBus protocol. If it can not, the
+	 * driver needs to take care of block reads separately.
+	 */
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		tps->i2c_protocol = true;
+
+	ret = tps6598x_probe(tps);
+
+	if (ret == 0)
+		i2c_set_clientdata(client, tps);
+
+	return ret;
+}
+
+static void tps6598x_remove_i2c(struct i2c_client *client)
+{
+	struct tps6598x *tps = i2c_get_clientdata(client);
+
+	tps6598x_remove(tps);
+}
+
+static const struct of_device_id tps6598x_of_match[] = {
+	{ .compatible = "ti,tps6598x", &tps6598x_data},
+	{ .compatible = "apple,cd321x", &cd321x_data},
+	{ .compatible = "ti,tps25750", &tps25750_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tps6598x_of_match);
+
+static const struct i2c_device_id tps6598x_id[] = {
+	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)&tps6598x_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tps6598x_id);
+
+static struct i2c_driver tps6598x_i2c_driver = {
+	.driver = {
+		.name = "tps6598x",
+		.pm = &tps6598x_pm_ops,
+		.of_match_table = tps6598x_of_match,
+	},
+	.probe = tps6598x_probe_i2c,
+	.remove = tps6598x_remove_i2c,
+	.id_table = tps6598x_id,
+};
+module_i2c_driver(tps6598x_i2c_driver);
+
+MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI TPS6598x USB Power Delivery Controller Driver");

-- 
2.55.0

