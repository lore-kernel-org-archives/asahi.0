Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654411;
	b=OhW4E1dfyFlvAqkCDkqvLpZ8r7bulTx8mC2qvuCYvDoe2JQDyG/7hVxWwF4Q+WRlPejl
	 yODxSGSHmpEGq9mKHbvK6h68WDSotFepYq15doJ6V7r6ttOvhT647/FkDJigSm5SbT0o1
	 B2yIzHxar9kCG5rZVqsm5EIPlKL7Zfc/lDd+G5944lGelDvKr/bSsX29y/1Ai/AJmX63j
	 DLipApLMhnLuB1rH6S29COqxPSns0V0HfzCw1uA/Tax4c11FgShF65DbmRF18Yvrw3PsW
	 F3V2XT1gHtGFmBQdQu1Ncax6+hzDOTHkREGqKPZkDSXliZDyXgMCYyQVXVNTbrultTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654411;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=e5szLG09BDbOjbUS8HjffVQeyptCSU4q676Qd4Mu/q4=;
	b=GUVd8znxmwteiWHFyQmXkYAMih3+1xTLg8YEsnbEwYmOEEKyvAjhKiS758pLRv7a1p0I
	 R9qCMsmDZuTMOSen58edRO5XYofUoD8ungGY1bdcFZAYknAgu/HApgacbFurAjRuJEEBn
	 F4DcGlZZ8mnmyJjaG+bxdPBNZCX3nRJMCiuaafMpIxcdBxsZca7IBD5wPljqk21YSjkrT
	 OU6W+OkhQW9wfz5yOTe9ExvAvvgrqsVF/2UrsKUt4+QRtDPGanenWGtOepIUk7cfFtY7W
	 t0srhafUQ1bJ4HZ8zKehbJncq4LTqvT+URGgeU/B7KfPq74eAhNeLAGzDiy9Ubk9T9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzwlcTkJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9753606A33B;
	Thu, 26 Nov 2026 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzwlcTkJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654411;
	b=Bqh1ZW01lyxADVe2Io7zTtWaq+MYPQDb1mkqpF0vComfXR0siOsG3XndkzqkJY21x2iB
	 8HUI9OLV5ZZH04Pq4zfeSDMiMUZ4OZJlwag3fzDDVO7d1NRk/uIwdH34ZOXwk0V5q8Erp
	 WyRa25OIfKjbnPwyPK4i/fJII1tFF4/kvXl0zp2M4cp/wocf4lO8t349jEKPx2jZmoPp5
	 Avz9JtGBjS2K5mvbeMn0Nkwy+KiXMkIeWNQoo/0hsxgOEnqTw5WPR7qIzLMA1a/PVPZPx
	 VJD++VQdj1kr3kaoMBGpdPWF9DYYcOJZYyFdFb7owDcdrUCknXN7a+FX/uoGC8ZMJKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654411;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=e5szLG09BDbOjbUS8HjffVQeyptCSU4q676Qd4Mu/q4=;
	b=tD8m7pXp9Bo9X6alXVFuqrDYax3hA409Lc9AcatVJGjyJLtMSrhZ8aE7Vg29146AUVDi
	 It5vY/tVmvTZo5EfUjlof4qOvYVe5Q4qWHZqxZ2uSA1tmx4JtFVFUOHnKiTAm3EAGFwNF
	 CwvUG/xIzy0CBUc6FUP5x05E1LZDQcXUW/3cjOFfC+aPfuJ/xOGI9RYz6AlETTKChJwlC
	 4iLamxMEtuDfq/sqMEK8XMJLINpRCcNhuUgKk3fTyMMRinPm3v2paAzwxwINHK8bVjx8w
	 Npei9vDRxE9WZscrMhpKeeXhL+LT3DZtL/xh5fT9mNxjpAo8kvrO0kTiqZEhkVvJOZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85E291F000D2;
	Thu, 26 Nov 2026 00:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654411;
	bh=e5szLG09BDbOjbUS8HjffVQeyptCSU4q676Qd4Mu/q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=UzwlcTkJ7DoSuAOzI6dl1862qL3TLbNgrnGUPbDc7hCFwzb0MP+INgSVx84PAyje9
	 bt5VGZOyypdXorxXHCHUZZMu/5MC0Xz4AKvvkkd6RV1IBHQdZfM2RF6RMA/LLud540
	 fuNxyeQzR7PKyPT2qI+KehZ+LRViU4J0Qx+fG6KxHzt9lpZykjza8R3wmrvq3+xjOh
	 00mzL9nPdcNEiF3D3RFYinUrkxEv5tq689QpqRtN4dz/rZ46aG4lDr+Zxzj70cXC4z
	 wjm4z7ZGmQKaRV0XwnDnD8HH23mkUhgpSBJzIyg0xRy42x2EclzzI2eUAQoLLgtQCl
	 AM8m55EvYFQgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F5F04D129;
	Thu, 26 Nov 2026 00:53:19 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, sven@kernel.org, j@jannau.net, 
 Thinh.Nguyen@synopsys.com, asahi@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: dwc3: apple: unregister role switch outside
 appledwc->lock
Date: Thu, 26 Nov 2026 00:53:19 +0000
Message-Id: <20261126005318.71705-2-iasnezhkov@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654398; l=1659;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=Xp06A3FHG/XK7qHNfZ3rlNyEPxz/IhGg4iOv80ET3F0=;
 b=AMfuWfdiddw8Ndl0XmAmmSC5iJnrSaq7gxYQF6yEDW46sW5YeVP9hlYrUZMsVNGqKKrB6EQDi
 +XqDVUXnce9A2w2E/84X7eWHemTdvEIA6kPlEHeszqjjxSSqbLAtSVO
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

dwc3_apple_remove() holds appledwc->lock across
usb_role_switch_unregister(), while both dwc3_usb_role_switch_set() and
dwc3_usb_role_switch_get() acquire appledwc->lock.

Calling usb_role_switch_unregister() under appledwc->lock creates an
ABBA lock-order inversion against both sysfs attribute teardown
(device_unregister() -> kernfs_drain() waiting on an active role_show /
role_store callback) and synchronizing usb_role_switch_unregister()
against in-flight callbacks under sw->lock.

appledwc->role_sw is assigned once during probe and never modified
afterwards. Unregister the role switch before acquiring appledwc->lock
for hardware teardown.

Found and drafted with an AI coding assistant.

Fixes: 0ec946d32ef7 ("usb: dwc3: Add Apple Silicon DWC3 glue layer driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/usb/dwc3/dwc3-apple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
index 1f474a8..035aeeb 100644
--- a/drivers/usb/dwc3/dwc3-apple.c
+++ b/drivers/usb/dwc3/dwc3-apple.c
@@ -487,10 +487,10 @@ static void dwc3_apple_remove(struct platform_device *pdev)
 	struct dwc3 *dwc = platform_get_drvdata(pdev);
 	struct dwc3_apple *appledwc = to_dwc3_apple(dwc);
 
-	guard(mutex)(&appledwc->lock);
-
 	usb_role_switch_unregister(appledwc->role_sw);
 
+	guard(mutex)(&appledwc->lock);
+
 	/*
 	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable connected event and
 	 * dwc3_core_probe was never called and there's hence no need to call dwc3_core_remove.
-- 
2.54.0 (Apple Git-157)



