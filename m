Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331EA3ECBF6
	for <asahi@lists.linux.dev>; Fri,  6 Feb 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385252; cv=none; b=Q9+OpAUo1vJpl+Xf0zldd7owUmGZ555qXD+ZqVKu7op9RoR5kaCyelCY87BlhlM4CsN5kLpGBArKtWHqa8zlZxUOHLwcRluT8+SpSlPrkGZJiyfh9RiGBOTpIP5kYK2v21/o3cMqfF0UNEFiJyph4KUMnGwLfoF7i0CYrPoPu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385252; c=relaxed/simple;
	bh=P44VP+76f3XIOiXxwtqpbZTku04FznTwYaI2CBS8RA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iuxMw9x9/AeM1xUCdNw2p77l1C6Wo175yj33KlQckrLt70EaBZGm4+uCXfFbg8bOBlBrWEWAOhlRfKi+5eIZA3b0ksgv31fB+5EUoUwB5PX3JZIapP8mg4PMQ4b6KJA/yFpd+2VC22KZmYLJLHDMA0mWmG7QDwbDQFe/+9Skqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SwJPdp10; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwJPdp10"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso18680155e9.1
        for <asahi@lists.linux.dev>; Fri, 06 Feb 2026 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385251; x=1770990051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkO0ZDFXsTERryZDi+Xw4hkZo9DKWHuedNYRkbdXlU0=;
        b=SwJPdp10vLe1T9dHF9/uWJdTQsyKHad7cOgvqq7JOZXRB6N9zaarG/xoHNd/06OPfy
         C0BHpsB8NYv3YuBOyQUKXyVQNd9jIE/2MHDOHmrcIpdO5wDNUkaxeCZmzncfZVfrOvqT
         +CJZRkCLLsaD4DTOOyvBPZAYJLtiDW1Ji7Qv0kOLkYPbIFgaXQVx58KjQD7GwpYLb5lv
         LeW7DSOUWKFz+sRGNeP3pc8Kd68yDW6hBjI9NKxyZnDc30byPWvAzjwdPyFr0GQl30pi
         wBBJc0Dx6chtzqdEwcWSTGF9CXpCMzoNiklNbtKx+JPHPpn/75K2vBTlfRX8ltD1tvNF
         ZVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385251; x=1770990051;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkO0ZDFXsTERryZDi+Xw4hkZo9DKWHuedNYRkbdXlU0=;
        b=a1ADdIeZ1jp0To1ODmJjqFLzK+N2zNJvdR7pkKRdFuCr0f9AStIIbsgQYBb67Mb2Kz
         nsO4+VWcp0I5GKnoDsZmDBOWIBJjeVSrVs7Y4ZBIfOyJxq43kVui19FDB9GuTiBJX1WT
         4nqNCOdsldKVxrp+yP8Xq4yHFsIwmqpbwBMSe4OPcHLzv9YmV9joiN7uxHdXkjU0eFYj
         ZrUAIt5E/0pSy3J5DxFOCqX5jP6/SxWOYuzW4jNq/6Wn6N/gJ+v+Vj0QeflogMAK0447
         MSSjmuCT9/XlUd1R7jkz8JYuTq9mfMd4g4WaWx1lBQUsm2qg/OkgxleR90a4riIVfEy2
         RKyg==
X-Forwarded-Encrypted: i=1; AJvYcCX9wTDoVn3Gluzo2IP/8epZS8ik5lLLF0/WCePM/BWdcar/czbuJ15U1qS7V6jpf/MQnQA6AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqhqnzK3Lovj2LEb4Rj+Az5CSAz9QLmJ7myO88smDs9lc1R59M
	jdX9Vq0QW6S3bsx8mUlqEY6dJLcJuFA+KuYrKphQR17SjCP5zCTqvVNPbl6egvVZftY=
X-Gm-Gg: AZuq6aLVZ6LHNpMRnL2KPLHnnPv5Vs0+x/ScS1mJk97uLDqeVkcgQXAaxf787GHfC7o
	xFRmByTgHX//UVH5YJrcc4UrrQDDkW0GaHZ3kM5AMtf2+YdiT4a9PtcNuEW2tjMWsWYnWLYhNx8
	GBwCLoaeuNfexnkjh+jezmVBWVG6H+L3EYBJVUg45/11ieLeMMEpqKYpveVd1+uP9icyGHaHC8M
	6/ASD21MYG/BS9FZcMuemciRaDcXI0/wYIrCSW4LjoPBAyYzpdU6rUWKG/koMakOGXbgQNLDBmS
	c92eCqAOy7tUR1HxNYAkc5vBbb2ORD2UM4EPtQz/uhmw6umgFHABZKQY6Z8u0sIAuwLFr8kvpsC
	S5EFGqHaKdXIs8mQzWDjbNsprSKSVPrzwha6YtHdK+ITVYP+PdycLJGeWFOnOkkQSrQanRSNNzS
	g8dKI6N7PcZVo3uQIE
X-Received: by 2002:a05:600c:8b61:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-48320966711mr32154065e9.23.1770385250573;
        Fri, 06 Feb 2026 05:40:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8bbbsm81547395e9.3.2026.02.06.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:40:50 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] phy: apple: Add Apple Type-C PHY
Message-ID: <aYXvX1bYOXtYCgfC@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Sven Peter,

Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
	warn: 'resources[i]->addr' isn't an ERR_PTR

drivers/phy/apple/atc.c
    2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
    2192 {
    2193         struct {
    2194                 const char *name;
    2195                 void __iomem **addr;
    2196                 struct resource **res;
    2197         } resources[] = {
    2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
    2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
    2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
    2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
    2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
    2203         };
    2204         struct resource *res;
    2205 
    2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
    2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
    2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
--> 2209                 if (IS_ERR(resources[i].addr))

This is checking the wrong variable.  The * is missing.
if (IS_ERR(*resources[i].addr)) {

    2210                         return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
    2211                                              "Unable to map %s regs", resources[i].name);
    2212 
    2213                 if (resources[i].res)
    2214                         *resources[i].res = res;
    2215         }
    2216 
    2217         return 0;
    2218 }

regards,
dan carpenter
