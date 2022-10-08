Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4183BA44
	for <asahi@lists.linux.dev>; Sat,  8 Oct 2022 07:03:32 +0000 (UTC)
Received: from [192.168.1.101] (95.49.30.201.neoplus.adsl.tpnet.pl [95.49.30.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6AE3D3F265;
	Sat,  8 Oct 2022 09:03:24 +0200 (CEST)
Message-ID: <06a1b6fa-d179-97c7-995e-91d93123a5de@somainline.org>
Date: Sat, 8 Oct 2022 09:03:23 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 2/2] irqchip/apple-aic: Add support for A7-A11 SoCs
To: Marc Zyngier <maz@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221007200022.22844-1-konrad.dybcio@somainline.org>
 <20221007200022.22844-3-konrad.dybcio@somainline.org>
 <37c075fc9aa9624d65b8fdda3cb5ae96@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <37c075fc9aa9624d65b8fdda3cb5ae96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8.10.2022 01:17, Marc Zyngier wrote:
> On 2022-10-07 21:00, Konrad Dybcio wrote:
>> Add support for A7-A11 SoCs by if-ing out some features only present
>> on A11 & newer (implementation-defined IPI & UNCORE registers).
>>
>> Also, annotate IPI regs support in the aic struct so that the driver
>> can tell whether the SoC supports these, as they are written to,
>> even if fast IPI is disabled. This in turn causes a crash on older
>> platforms, as the implemention-defined registers either do
>> something else or are not supposed to be touched - definitely not a
>> NOP though.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> ---
>> Changes since v3:
>> - Replace use_fast_ipi with has_uncore_ipi_regs in aic_init_cpu
>> (logic error, this was written to regardless of FIPI usage before,
>> but touching Sn_... regs on SoCs that don't explicitly use them for
>> IPIs makes them sepuku..)
>> - Drop A11 compatible
>>
>>  drivers/irqchip/irq-apple-aic.c | 47 ++++++++++++++++++++++-----------
>>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> Since you cannot be bothered to read the review comments on
> the previous versions of this series, I'll do the same with
> these patches. Feel free to stop Cc-ing me.
> 
>         M.
I'm sorry, I'm working on a lot of stuff right now and I was almost sure
your email only concerned adding a cover letter and affirming the discussion
on the fallback compatible, so I did not go through it again - but that was
obviously incorrect. If you don't mind, I can respin another version of this
patchset, addressing your comments.

Konrad
