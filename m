Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2813D7F
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZaMI5er0"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 22858876CC;
	Sun, 29 Oct 2023 16:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592182;
	bh=BU8U6R0c15CvJccRkvD1thlVlwUhL/AmsQt5f4pYess=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZaMI5er03yJd6BvcC+DlemqVIOJ0c+csV7ADzH2hyUfW6KYHRBisDfDs1nYrF6H7X
	 uq/PfBWTG49jw0Rl0fQGA4opoEFE6vRnOU75L/aA4iAIFlLsvJLw6r35w7xVGe+gl0
	 eb4jGSW00CsSrkgRTSKaGowbQqhRyHwJKInGFpXrntUIF79Exdrm3uxYSAMX30ydE/
	 en6REeX1oj4WySikBnw6befQ8oeG380wRVzLhhBtdQ7k/j+u1jjZnKJfBSeDYDaQo5
	 1WXfxMv0Zc2Gx6hBszViry+7L1QCMgYD5fick/3k5SZDtpq9YchZnDC6OROl3MKKy2
	 Bqr9eDwM+XaSw==
Message-ID: <1f5dd916-f4dd-4030-8908-cb6eb3c21753@denx.de>
Date: Sun, 29 Oct 2023 13:07:59 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] usb: storage: Increase read/write timeout
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
 <20231029-usb-fixes-3-v1-2-0153210a7f55@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-3-v1-2-0153210a7f55@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 08:23, Hector Martin wrote:
> Some USB devices (like hard disks) can take a long time to initially
> respond to read/write requests. Explicitly specify a much longer timeout
> than normal.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Can we make this configurable with e.g. env variable, similar to 
usb_pgood_delay , to avoid affecting existing users ?
