Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5A211A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="NN8AUnuy"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C0BC187C89;
	Sun, 29 Oct 2023 16:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698592187;
	bh=eQ8nfZwCuPeYrGYqFbI6cn3wU61qbgJb8nU15f0+t58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NN8AUnuyUlfIV5ruiQ+zB6G0Q9dx6aJe7pWSZWVyYzGKsnIDTWURktbsgUjZAgFt+
	 PqN4sWcGpCtSl4TqsQK/UBKQaEqdO4Gh3oUMRl5AEpbrMIQb0i92l19O54OtgB9sjk
	 +rmvtPu2dMORLqSCvpNTivalreFKcdMDVu7ashNfJerQuUaZMoCoNhbOUw6jwCoWbw
	 WE+okZ7PajMPg2pOjJ62p9kIN7wpGBe4CUtW9eKgy45eNxZX0FH6hUZl+igNAMGJ4b
	 fgSm4Mjj21YqCD9EiJBFT+spB/c9+t53e+uP+Dt+HulShvyQaO7oE8NbhHbgtLOILg
	 bb6ogDklIONmA==
Message-ID: <4aba3529-7019-4cba-a9af-a241d2e57e2c@denx.de>
Date: Sun, 29 Oct 2023 15:35:12 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] usb: xhci: Recover from halted bulk endpoints
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>,
 u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
 <20231029-usb-fixes-1-v2-4-623533f6316e@marcan.st>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20231029-usb-fixes-1-v2-4-623533f6316e@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/29/23 07:37, Hector Martin wrote:
> There is currently no codepath to recover from this case. In principle
> we could require that the upper layer do this explicitly, but let's just
> do it in xHCI when the next bulk transfer is started, since that
> reasonably implies whatever caused the problem has been dealt with.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Marek Vasut <marex@denx.de>
