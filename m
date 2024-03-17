Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14E1CAB7
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710692569; cv=none; b=pHu8ehrPmOZejgdHcuOziQGbaxbw373A/yXyGCDVOfYDXKdWXNOZkzvmiwrqixsNaSTGm73eFGPyRd9KKlj2QjHeCHpZ7dyGWkjosNR1kXkDZlONZyMhqLufXWsPAc/KsB370iUOJ5s2l9/8Ek1ZGqBSzSvop0rYEMpEpJh6U6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710692569; c=relaxed/simple;
	bh=N6FL/e9x4ptavD2QAh/+6xRKevvnNmA2/id4TiavkmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJVsLTwgeBKyLNkvuIfittb9z8+GTAUB/QJZnPis6HdV0IkB+OVpLVA0SOmkLukrh3NNx6aWF0zqzwp4E/UOaMEE0m+/PYx8GjIPzDKoqMy9sCzLOpVxDxvUzyslGdloaWzG3w7JWtph0TkogU/kSWLpr23K2UGDYRjNA9kzVE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=lk3lETIT; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="lk3lETIT"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1409A878E9;
	Sun, 17 Mar 2024 17:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710692559;
	bh=EbZm3rVdKPwU+yIx/o5aFdLsK9ERT+VfrYMegUsrzr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lk3lETITsjpTPMlTr22P84bl0NFJeD6q+krpKg5I6L6nQzJs/t6TKEloHUNPu232F
	 Y2o7aVKqftdu1Em/2Bq0kBQet75i/FutIKIA4D4s4eX5X8tXbElQz8nX+G3Xzs52Di
	 q3zf8fqDEoV6fIY5LGXPFPyM/NiL75tx4g18l7+TSc/UVFvxW1MiaYUp0F3KIWwGaL
	 XhwGd2evexjcc1kZtD3Y4EWmkY01R6s/whAmEHLTZsPrV8CQ9YZR0MXjmvds4s3LId
	 jpuib24AlFagnt3/mOBBrl2xKjN9O5YgYcaxTdKMyvq9cTADy52gAmUi3EpJvN6zc+
	 PoCSRpZibBuDQ==
Message-ID: <b994d7ed-b7cd-4725-a682-b4a1c0aed33f@denx.de>
Date: Sun, 17 Mar 2024 17:06:22 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] usb: xhci: Abort transfers with unallocated rings
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
 <20240317-asahi-keyboards-v2-3-d3f4b8384f68@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240317-asahi-keyboards-v2-3-d3f4b8384f68@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/17/24 12:07 PM, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Discovered while trying to use the second interface in the USB keyboard
> driver necessary on Apple USB keyboards.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Marek Vasut <marex@denx.de>
