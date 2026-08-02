Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797FD3B058B
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785670458; cv=none; b=RqwbX9cuzK/CpvZMchl19Ys+39TtlByxaq1wth3WXdVVTd0tUxphSdRc7zrzbdTVrxG0Z4zk3JG4CXb8ebgqJJRxSFbfgechw6vlciTpm/WKcwSnkYFKi45Wts/jUMW+r4CE1ZKpt19pYDgWxOS16tFBTWPGFRmnK+m0sMnK60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785670458; c=relaxed/simple;
	bh=PErM8AyAp7db7Mvhtqh+YFaFqZDfTFh4xTGjD1m5Frw=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hbsUAz6c807AQL69LkVYTtNNCOYch8RNGNMlLITEY1OH5BlFq8NFOpWERUbVIlwjKKlWjWF/E+Y1f62elHicaNwPTZsWvWOOFsN8GcsSN1J3EuGKFWFczWVTZi+oWL7aPuEzGbjbmfpkeYyvT3cKLn1lrMks/0q1bt6pe616wvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=JagXz8Ih; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="JagXz8Ih"
Received: by chaosmail.tech (Postfix) id 883B41C7DFC;
	Sun, 02 Aug 2026 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785670426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQ8FA2fWTWW3ychqhFt4dxOngt5CRROg/bBvmNFIN9g=;
	b=JagXz8IhkCCObi807f8UbOSh5vSP51UyR0EcFBXSFJjGZN33j8LTDk6yPiBCugJP6uUFcX
	zG+UhtZaxwANGakNhuVQyL4mVcgI2vQcvg/Mz+axK+C14rK9aKZ+l+X9WrRRZlAfDjaKjF
	X0NFjRdbLWt9uU5YaZkXLoJhoxE0Akw=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/7] spmi: apple: Implement remaining commands
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260802111853.GF806854@robin.jannau.net>
Date: Sun, 2 Aug 2026 13:33:34 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
Content-Transfer-Encoding: 7bit
Message-Id: <78A4FB29-7BD0-4AD3-973B-F73012F6671F@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
 <20260802111853.GF806854@robin.jannau.net>
To: Janne Grunau <j@jannau.net>

On Aug 2, 2026, at 13:18, Janne Grunau <j@jannau.net> wrote:
[...]

>> if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>> dev_warn(&ctrl->dev, "FIFO has extra data\n");
>> 
>> - if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
>> + if (!ilen && !(reply & SPMI_REPLY_ACK)) {
>> + dev_err(&ctrl->dev, "command not acknowledged\n");
>> + return -EIO;
>> + }
>> + if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << ilen) - 1)) {
> 
> Is the parity check useful for write commands? I'm not sure if packing
> all command processing into a single function is a good idea for code
> readability. The diff is annoying to read.

Not useful, but on the contrary I like that every command is sent via
a unified path, instead of using similar, but slightly different
functions


