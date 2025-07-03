Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2282EBBB7
	for <asahi@lists.linux.dev>; Thu,  3 Jul 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553421; cv=none; b=PIJYfX75xhxFMJOudPvjHiSDOar1Ln/8ey2SQFEeIaXXRLRwW04lbMuDSSJu38DzREvSD9IBvixj4QjJiZjw4QCwAdv5ladf9us+4BRk3cMu1U2nSl2q5r6VymeN1eJ4fSXb1f8pI2rNxywvW7urY4pIh7B5pEZ+6fEtKSEfTn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553421; c=relaxed/simple;
	bh=iphZ0xLbalXMFojOT6bd7BRieX/Qbn1y8a8/nwka6Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=aJAZYHzvFWZZWnp1dO1uTSKONpyztxeDyjinsdqCYmNclxV7K+aITnxg+WeZ598P6tRmYjnMU71tQfL0br1w3Fenl/BcefmW6v2bhU7FVv/X6iBm0CrXQg3jdnWtrs0eXfyOZ0fhEVhiFbZDXkXd+HsDU4tT8kaFzZ2eGoKe0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.36] (g36.guest.molgen.mpg.de [141.14.220.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9F6E3601D7115;
	Thu, 03 Jul 2025 16:35:33 +0200 (CEST)
Message-ID: <6be1c1c6-8d8a-49e3-bb14-dc8fcbfc2c50@molgen.mpg.de>
Date: Thu, 3 Jul 2025 16:35:32 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] Bluetooth: btrtl: Fix typo
To: Bastien Nocera <hadess@hadess.net>
References: <20250703142542.985248-1-hadess@hadess.net>
 <20250703142542.985248-4-hadess@hadess.net>
Content-Language: en-US
Cc: trivial@kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Johan Hedberg <johan.hedberg@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Kees Cook <kees@kernel.org>, Erick Archer <erick.archer@outlook.com>,
 Chris Lu <chris.lu@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250703142542.985248-4-hadess@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Bastien,


Am 03.07.25 um 16:24 schrieb Bastien Nocera:
> Found by codespell.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>   drivers/bluetooth/btrtl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> index 7838c89e529e..3d137944c458 100644
> --- a/drivers/bluetooth/btrtl.c
> +++ b/drivers/bluetooth/btrtl.c
> @@ -693,7 +693,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
>   
>   	/* Loop from the end of the firmware parsing instructions, until
>   	 * we find an instruction that identifies the "project ID" for the
> -	 * hardware supported by this firwmare file.
> +	 * hardware supported by this firmwmare file.

Without the second m.

>   	 * Once we have that, we double-check that project_id is suitable
>   	 * for the hardware we are working with.
>   	 */


Kind regards,

Paul


PS: Should you resend, it’d be great if you wrote in the summary/title 
if it’s in a comment or in a log string.
