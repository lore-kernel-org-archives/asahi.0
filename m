Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992C5811E6
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531110; cv=none; b=VeB0hfsllxEn7r7FguG31vQMK4od4f3mOEtp0ZWf2bTlRQpQXmVNJmfJ6vdpPn/hgprvhASnpZWBTOFLHCiCo3OUtmdhJ76nA3gF5C54jYFiW3BYZn1fD0q8poNX95owmbGEGOqjSvU/mMZPilgFPlx7E0GtSzyW8heIKJxBf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531110; c=relaxed/simple;
	bh=ckQNG8PmGQ10Man4rjKXrxbfF0MyKLKUahiyhmT+1aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMtOSl9qBNwbB1+igKx4tMV3OZzxXsiJjojZy/4/Z5jdh7bYJFj2yohvNmg8om8bl8fJ6//acJYUr4dyXWAEVfzl3JHXeIrlnsV72UsGS4c4fLzBUrnMzG36Es2qFxsKezxSn8jsx553jjO6oa7w5Vc+B5XaRPKUiHR42fwTmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=restZy4x; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="restZy4x"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 39B938272A;
	Wed, 21 Feb 2024 16:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708531105;
	bh=SA/qwtnWEOvG5f0DmwLRierDsn/a+Up+I+pKvJT0OC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=restZy4xglmz51rRBcad8i3xERaGXGRpNO8ABzDerpb+AxrEtX2HO/sAA/TpTsDdC
	 Vw2/OWRsQZZ+SxBiXRnDkXpkSixw7DjtXEWW0gOoG2AD7xVFZ7X3BIgcv9+fT/yK1Y
	 Z/ZVghqTGf2MhWyM8A70zYYupf+KAWtRJ41QaiEuaBDztRoLOO1JIwOyDwxHYVnLhu
	 MSyXxsIkgJIpZwY/3ylLOC3lmjGqZyB+Bzm5QWgCoBXmFNIA7nxfW+S68LDIBJavdE
	 ePCwvumwXPQHRZAmejZuIKVdGXmUs2dzmHraYUMyWqUMOsIxsfusmkuwaOX80gQvIe
	 x0sAXQMqT7ixg==
Message-ID: <d4cc7a36-5703-4f68-a760-e8fb8bc6ca5a@denx.de>
Date: Wed, 21 Feb 2024 13:28:46 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] usb: xhci: refactor xhci_set_configuration
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-1-814b2e741790@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240221-asahi-keyboards-v1-1-814b2e741790@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> In the next step endpoints for multiple interfaces are set up. Move most
> of the per endpoint initialization to separate function to avoid another
> identation level.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Marek Vasut <marex@denx.de>
