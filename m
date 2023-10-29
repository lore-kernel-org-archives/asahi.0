Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7547A5D
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MkDlRZ7x"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EF39087141;
	Sun, 29 Oct 2023 16:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592180;
	bh=7OVg+BRusy/y81nWytr6FBpaloCTaOMmZEublLhSXh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MkDlRZ7xhFm10sIfcllHc1iXRw9X0ZGrN/rdljtU44N9CitT0K8UW8GffxsXjvnYR
	 WJhj9bS88q7ekF0RxJbk24z3pfP+P8+p38KkIAmmH8a4OgL5a3Cyvwkle1ltidd8tq
	 WHc9t32Apx8khhtUaTF/ohyU8s480dIP8NKMIWDKJFDTH+GYXcnBeSDt2ADionVjlF
	 vI3/dm/NkliKqXFFeMv9JXOuhb3uMUIJKqYYBwfct/WBcaRAoVCvJFIcDZoDakY4E0
	 TMhhX7wJjHA4XcptdNYtFRA966p6T6ygw1bqk7JDOhtr8G9QM7YCs+uhgtW1OqvNwf
	 +aWqCojcc42MA==
Message-ID: <d1c03c32-95e2-4479-8a33-c6e89729dec6@denx.de>
Date: Sun, 29 Oct 2023 12:38:06 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: xhci: Hook up timeouts
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-5-v1-0-54bb13001f54@marcan.st>
 <20231029-usb-fixes-5-v1-2-54bb13001f54@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-5-v1-2-54bb13001f54@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:36, Hector Martin wrote:
> Now that the USB core passes through timeout info to the host
> controller, actually hook it up.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Except for the negative timeout value question, which needs to be sorted 
out:

Reviewed-by: Marek Vasut <marex@denx.de>
