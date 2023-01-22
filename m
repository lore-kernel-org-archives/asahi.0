Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC0A28F1
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 17:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7546141DF4;
	Sun, 22 Jan 2023 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1674407236;
	bh=STswfbrxNzrLQe/qOJxr5sc2knuGzIp+GarJcb4y0YU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UAJW4mFVbtX4QSr9+iylnn9k+ZSfMpET0eIGNETy+90g/IoWY//LSQ/50BiWKNEpH
	 eru83CR8SlVcZPLXLF/YznAJDbVtzf19/m+j6GYhd5/BRZHdV6TNiMUmZRYcMkDQ11
	 0X9qao5HMG1bZZC03pih0QrgKNZPKPdUuBEx1Qp4JHTnNfiHzVSX0ij/OIgPKzJyXW
	 fWHYTPuCHCgx2rdDlSXOywfPTPJ+EfsZZS1r8ixutqj2+1KuWyTC7X3RdRI67doJ68
	 JufEjETWANK5DlLj0d6D38X5RU9CR0b/xH92oCIemTow8pF4Sj7J8LY5WiA/OPa3J6
	 Zdm4rIFLwdicw==
Message-ID: <dc32dfd0-7ad9-d295-cc35-d6bf2490f8a8@asahilina.net>
Date: Mon, 23 Jan 2023 02:07:12 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: rtkit: Add register dump decoding to crashlog
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230121073741.3807-1-lina@asahilina.net>
 <938ee8b4-3745-43a7-b813-801df22f2888@app.fastmail.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <938ee8b4-3745-43a7-b813-801df22f2888@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2023 19.19, Sven Peter wrote:
> On Sat, Jan 21, 2023, at 08:37, Asahi Lina wrote:
>> When the coprocessor crashes, it's useful to get a proper register dump
>> so we can find out what the firmware was doing. Add a decoder for this.
>>
>> Originally this had ESR decoding by reusing the ARM64 arch header for
>> this, but that introduces some module linking and cross-arch compilation
>> issues, so let's leave that out for now.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
> 
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> 
> thanks,
> 
> Sven

Thanks for the review! The kernel test robot complained about builds on
non-ARM64, so I'll fix that up and send a v2 ^^

~~ Lina
