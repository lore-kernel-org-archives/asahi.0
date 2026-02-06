Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491E28D8DB;
	Fri,  6 Feb 2026 21:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770414536; cv=none; b=DOTVSGPie+LaHoy0OubpIJ94HWF//xZlLQMtLnBXZWI2ueItNS5EYE+Q8Rrk9XjmCU20p4XXsQTM99ubJx/tWExKGTzqU+vWrzdSk/3tj1MET6lU2D2bwegTGz4IWZOgb1SgZeSUTTILclwkTyDyRJkleWNtCAYczrhBsf3QsEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770414536; c=relaxed/simple;
	bh=H4erEfFToWfA+jBlL+HzFAov4TXWTZ4TqD9JOrZRmYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmtrJ96p8U56YuAYoYRiW752zUa1NCLnYHYozsoOmohOFszgWlCaISBRqydjkSrau84h4He8xjfIvzYm7jupOUONAjv9/m7mPP9MBTVrdl2uYburCxIJEyiqnlzzM+iOBQQ+HqtFsAyVXrZuo+Z6BJtjTaPrmIa/uIXw54rsHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmGMT+PG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmGMT+PG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB0C116C6;
	Fri,  6 Feb 2026 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770414535;
	bh=H4erEfFToWfA+jBlL+HzFAov4TXWTZ4TqD9JOrZRmYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZmGMT+PGeTzXZO+POJyn2sjH2EwLirAqkA5MCZoTylQFmpKaTF74vh7v+MVhvogVQ
	 5pDkxCSVhCnpH18eWqoHtjadUXSq7Zh41dMGgS1u8Kj1Yw6J65uS2zhhwuezAW13zR
	 glma8FHw5oOBbljFoTlD3CCNCAN1ySOGaltxJEKDGgvckBzsqYPVROXDpExH1UPyzo
	 dvgRIx7MGZFCLWGHeo+RvDS02vpdY0LmeVEixaGrQa5y55dPcEOnOM8Z9foQoGVgEG
	 lslHXVbVoImpqhccP7i5/WMxFObd9iCL9qEMzfqCvPNpDdJaARNqBKHhFchBZPcDEO
	 UWNNS8i6TWA8A==
Message-ID: <d1a092bb-515f-4b37-ba2b-2d455778a6ed@kernel.org>
Date: Fri, 6 Feb 2026 22:48:52 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] phy: apple: Add Apple Type-C PHY
To: Janne Grunau <j@jannau.net>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXvX1bYOXtYCgfC@stanley.mountain>
 <20260206214743.GA194367@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260206214743.GA194367@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.02.26 22:47, Janne Grunau wrote:
> On Fri, Feb 06, 2026 at 04:40:47PM +0300, Dan Carpenter wrote:
>> [ Smatch checking is paused while we raise funding.  #SadFace
>>    https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> This is unfortunate, there have been useful bug reports.
> 
>> Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
>> 2025 (linux-next), leads to the following Smatch static checker
>> warning:
>>
>> 	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
>> 	warn: 'resources[i]->addr' isn't an ERR_PTR
>>
>> drivers/phy/apple/atc.c
>>      2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
>>      2192 {
>>      2193         struct {
>>      2194                 const char *name;
>>      2195                 void __iomem **addr;
>>      2196                 struct resource **res;
>>      2197         } resources[] = {
>>      2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
>>      2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
>>      2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
>>      2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
>>      2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
>>      2203         };
>>      2204         struct resource *res;
>>      2205
>>      2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>>      2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
>>      2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
>> --> 2209                 if (IS_ERR(resources[i].addr))
>>
>> This is checking the wrong variable.  The * is missing.
>> if (IS_ERR(*resources[i].addr)) {
> 
> This issue was identified by testing and is fixed in next by commit
> 7d55b44e2be1 ("phy: apple: atc: Actually check return value of
> devm_apple_tunable_parse").
> 
> https://lore.kernel.org/all/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/

I think I actually messed this up *twice*! Once for the tunables and 
once again for the resources here :(


Sven


