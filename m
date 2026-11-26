Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654411;
	b=bwCWjsUhsBZa6ue3+uJjVLKD9Ct1oH3DDXpMhzQGuaq4d+zFJ5V02q1P0gtFi1DgYDuV
	 mKXDaYIIYTv+luIK7JKjRCkGxithZfLlIkbMq9U7beHNfkaOXjYyu67gxxCTEEqZNX9+i
	 PUnf56XJDGbxY82NMNEXLWTgSofa2CjIdCVLnQ2K2JOoT4Thz+CS5I7KFM4UZSthQQEXH
	 j8zcq4CdYFvrhWBWppTNj21Ik8RvptLsf9BlLx/xj4GFJ+1VlsmExxnbfUoY/AH/iDnG7
	 YJaJkVEPFlh2fOitCRJKNmYkT8nNZ5oYBQjWpvf0+wqXIvxGatVJ+T4bp3H/PtvHhWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654411;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LklHKyM9bGGZVemTOxAFYstoICcsH+jH/mA9tcJ4Czo=;
	b=PvIhqoe/T0B9il/P1XDfVoEB/2I0rjz1hDYRl0PoCPbM3vgbezkA2h75peAXsTcHkl1f
	 ixAVHtKdSm+bceXqyCXW5CxhmV+i13SHYMIRqZ1q/Lhw1zzgYC/PMV7TDn7pnIwKSZhyT
	 xkjMiPlPluwhpcFn1ajuUGHr2AuhLQcaZhoe+mx2LjQKLip8CiONtKl1fivHQnGZwhkk0
	 HMJ8TDdT8iiKu65YNENPDdLDxqjCrUa3HyMgjj7KB4nFvAPSi5JQ7rWXcDFT3/rNjgfr0
	 zm4qnHD6vtpelJ89UcLkKWsOrWzWauPLN9+b2uEHXIUJw7k4j2R90/XXkP+exc5XY/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EcplUiGI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82472606A32A;
	Thu, 26 Nov 2026 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EcplUiGI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654411;
	b=N1Ig75m7Cjw4uXk+YPN+HXAmZhkztZRgZeUPtWJRKtedo7V2iWqLjvdS4fnUYOYOxbKr
	 xcxeTxZn5YdgFc8g7Y3HDLIyPOOG6D9FICnlVuCwfTkXrpkaCtZ5US8ythG4BP6WYY045
	 U9ni4ceL9QMYFDmYrNxN3dazC6sDcys41c/c+eM7gV7fplrszj1Kn4S+lXJKN7McbWU2M
	 +GTV/XwoSayp3GVswpAvXrbGjrHyVajeznc9OrJBdoAVOYlrw5gm6GI+Ng4jITXi7LR4T
	 0cualZ4kRcC0cGNJ977hRlITCLcwojuXAWTDKuxDaambLW6zP9tRPYntMmVMzZQ5sTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654411;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LklHKyM9bGGZVemTOxAFYstoICcsH+jH/mA9tcJ4Czo=;
	b=uJOcchUTeRJkbqtvg+WNM7zsoSEdAHvnnNzLZGWp7b9yknX2f/6DFR51tkEYfF9EKl2Z
	 dqZsCfXOhvEzqAdUkKGiDP4CTY8SElNIOQvgGend+CRH8dlyq6gscKowr56jep4gEmzOZ
	 EeTMBkVjISF3H5Dc5ZkorlPpz+hrcOxwZJjaFVovUojpqZdTCTfptdWkdmSUvgY6kXUlo
	 tR+htUVe87yYBMhnfru8BHP1k+VHZTZLdEGLJ84BqGywpb3j5m8/4dn6NktHpUP0Od29R
	 dVz6w+H9OZVsAjsKhuPjuLWk8D41Xa9Qu8Zd5PZTtocLK53tBHVINeAk9Y+1qhEHDDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5EDA1F000D3;
	Thu, 26 Nov 2026 00:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654411;
	bh=LklHKyM9bGGZVemTOxAFYstoICcsH+jH/mA9tcJ4Czo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=EcplUiGIKP+M6nB52puBXONiULPdM1uadUM+HY0vyvdxPURs9DHEexHXoBnDuT930
	 bicGqJE66jc/wGdz/yfG3msHiRYqIvFefYIooD8SU+n7SMPus8lQXLPjSThmmpISN6
	 gJMVKDCHVRS6tEt3h2qnCKauvmaBiFLn9sdWL9DS3fR4bmcJ9dE2dIyEGRnTFdhxPF
	 dXBCe82CfN87KBaBAOtZhnb8fbZ5YGSkfhjlHUiAjOsB2Lw6/OfkHr1lXyEhKU2qfE
	 QWW6/JMcleSbOeTn2DftGQ8EOgacnEXmmunr3lu0SyMflhJMZt8gTEItt81cAVWt4O
	 N2eNNAR8CZv4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F1484D12C;
	Thu, 26 Nov 2026 00:53:19 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, sven@kernel.org, j@jannau.net, 
 Thinh.Nguyen@synopsys.com, asahi@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: roles: serialize registered checks and
 unregister under sw->lock
Date: Thu, 26 Nov 2026 00:53:20 +0000
Message-Id: <20261126005318.71705-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126005318.71705-1-iasnezhkov@gmail.com>
References: <20261126005318.71705-1-iasnezhkov@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654398; l=2998;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=HEQ5iQ9eo9olCENuZfKzQGC2n/Gwb59EhbSCA5vNYwc=;
 b=G5QzeHdGiXzdcP+PvM8K/0OdSJoTP/Ex4wHciwx21LDAIiu+rhTEsYKt1rvSvpdv/gEwCbfKn
 8lfnNwuHv0qCyindFB9udVRtQkSe+5oCM1E/SDfNfxHZy6qr8o8HmqS
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

usb_role_switch_set_role() and usb_role_switch_get_role() check
sw->registered outside sw->lock, while usb_role_switch_unregister()
clears sw->registered without acquiring sw->lock.

A consumer can observe sw->registered == true, be preempted before
acquiring sw->lock, and still invoke sw->set() or sw->get() after
usb_role_switch_unregister() has returned and the provider driver has
torn down its state. Likewise, an in-flight callback already holding
sw->lock is not drained before usb_role_switch_unregister() returns.

Move the sw->registered check inside sw->lock in both
usb_role_switch_set_role() and usb_role_switch_get_role(), clear
sw->registered under sw->lock in usb_role_switch_unregister() so new
callbacks are rejected and in-flight callbacks finish before teardown
proceeds, and document the lock-ordering contract on
usb_role_switch_unregister().

Found and drafted with an AI coding assistant.

Fixes: b787a3e78175 ("usb: roles: don't get/set_role() when usb_role_switch is unregistered")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/usb/roles/class.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139..ce23e95 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -79,10 +79,11 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
 
-	if (!sw->registered)
-		return -EOPNOTSUPP;
-
 	mutex_lock(&sw->lock);
+	if (!sw->registered) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
 
 	ret = sw->set(sw, role);
 	if (!ret) {
@@ -90,6 +91,7 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
 	}
 
+out:
 	mutex_unlock(&sw->lock);
 
 	return ret;
@@ -105,18 +107,21 @@ EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
  */
 enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
 {
-	enum usb_role role;
+	enum usb_role role = USB_ROLE_NONE;
 
-	if (IS_ERR_OR_NULL(sw) || !sw->registered)
+	if (IS_ERR_OR_NULL(sw))
 		return USB_ROLE_NONE;
 
 	mutex_lock(&sw->lock);
+	if (!sw->registered)
+		goto out;
 
 	if (sw->get)
 		role = sw->get(sw);
 	else
 		role = sw->role;
 
+out:
 	mutex_unlock(&sw->lock);
 
 	return role;
@@ -418,12 +423,16 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
  * @sw: USB Role Switch
  *
  * Unregister switch that was registered with usb_role_switch_register().
+ * Callers must not hold locks acquired by the switch's ->set() or ->get()
+ * callbacks.
  */
 void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return;
+	mutex_lock(&sw->lock);
 	sw->registered = false;
+	mutex_unlock(&sw->lock);
 	if (dev_fwnode(&sw->dev))
 		component_del(&sw->dev, &connector_ops);
 	device_unregister(&sw->dev);
-- 
2.54.0 (Apple Git-157)



