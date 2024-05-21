Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6753816
	for <asahi@lists.linux.dev>; Tue, 21 May 2024 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716326614; cv=none; b=hfJdTWgUfsHsOhY/kPEfqHDA6xnMUZoo/T0pEGTL+AZ8PSzTsR3ubnSQEtfEMbUICfh2RKBHRr2FWrKtAG0A7gbfz9Y7Mbu606usE43cj0wZ4s8vyEL+MOFnx0S2NPD6Vdmq9KYLjplF+0MxrGW3JVmkkDebUb4m5zKWPn58OAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716326614; c=relaxed/simple;
	bh=NxIzrh4khli6BtsxRwVSJwbpvOZDP/o0lzeTpV7UeKw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Lq/WgJB8Yz+j0ZtTLhrxY1AfE3CpsqO1vHNNmzX0gHJZfi35ORVvMJcUReD6GoWF1J7KegYzLlPQfcRHcl7IlWIDucanluR5+UIZa6yQlpCHaPNgBNBTkpq1L8TRYFKP9JK1QE5ZFrQffZiHZZD8AmqGQ6WpTrok17/VKqnw5S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=FMSYVdw9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TVGovWvp; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="FMSYVdw9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TVGovWvp"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 23FAB138019F;
	Tue, 21 May 2024 17:23:31 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Tue, 21 May 2024 17:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716326611; x=1716413011; bh=Lypdvfsz3z
	phgumvkJV1BExYo3xnVk74JVSfTlNrG60=; b=FMSYVdw9Qn8MD9RVZQf/Zuy4bc
	jpLxCWF02N7/GE5rfPTG6IMsj2/re95EO/indbGdKzN4ON4mR67KKdGR2B99wYVF
	wPjbUboWiViw79Kb58qtZywRtJZ+dXnUDMMcRf74ZtPRDwB+JehhbAG92kYgtELX
	m+0wa34jC49lzd38M6wNI9nmLDN14HjVdr5CsPOa4VTYu8HswXcaIyRmalgvFcgm
	RRI9XywWmliVxknQ82PgsZq5GfzHxPjlSLye4mG+kGx9u2kVIdVhoROjAgEtHv7B
	ywLXiFCwE78Ok1Jc6WOMldgFuApXDKskSbgtwy2dOTXJDEgBDt30hKeRwwow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716326611; x=1716413011; bh=Lypdvfsz3zphgumvkJV1BExYo3xn
	Vk74JVSfTlNrG60=; b=TVGovWvp1m6kCNISkgS3teCa5P4Te6sXgJbbbMb5HUWt
	WL9wLlaYwWDoVGJu9biHqerJuPJcBf5jjrALTUSuPcCZR4YGJXJNQD4heM1M7aRW
	vafjLh2AyLDAl1kd3M8++JdG3j7vhCLHfuR24gfRpO5+xGC3u+w4VWgZb23mactC
	gLmOg2LdSZ3wUtqtyuRIqtDHkNJpRPhfcupPc41GRR19/cUUzTVhvi2kcuwoIR0U
	RM9uGS/mS1ho6coJJ9IGDBzGYFet2bQIHRAp7FWx9CJhABLzgQNCdCmvgfp5OcAW
	dQAok5ap4XV2HgaEWjggYcVlvd+5puyOo6QQEY82KQ==
X-ME-Sender: <xms:0hBNZlT_Ol_fQoWOQ6CpF0wWeCEUIL7KWG4M-i6gHt9qXJ1NVQXFAg>
    <xme:0hBNZuxK6g4ulXa-bXldbIhI2ywr9DtGYfUYCVQot11RPrsWWXuTBZpoJ_3mgl4J5
    oTnExiGMG2GvA2c9rM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeivddgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfl
    rghnnhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
    gvrhhnpeevvdfhtddvvddtgffggfeuteduhfeigeevfeffueekheetffekjeehjeefhfei
    tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjse
    hjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:0hBNZq1GAoos4DFZ1YiNnVf3sjltHfscMKoFr8k1AUZ9tD852Tnxgw>
    <xmx:0hBNZtDx1kA1OU4JXTeAQd-Y-b0vWHZQtex55DCpg5O8j2Hl01_hJA>
    <xmx:0hBNZuiZyUCXlgr4W234Tn9HJNSk6_jhPxzSPdYjXkN1dXIj6oWmlw>
    <xmx:0hBNZhqU40iHct5pR2EYOqBFKNug3RxUghhm42MlErSkC07sl1Nopw>
    <xmx:0xBNZpXhdoG2QaBvJtTBO3bMgQOm1UarZF57ud4zuUpfh49nVs4CMHSK>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9FF9A364006F; Tue, 21 May 2024 17:23:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <d212a141-b94f-4717-8ab9-c150dc06dc30@app.fastmail.com>
In-Reply-To: <79a5261a-c215-4db6-a81a-558223f48ab8@sirena.org.uk>
References: <D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org>
 <cb8822182231850108fa43e0446a4c7f@kernel.org> <Zkw9kK0sXIgfqd01@shadowice>
 <20240521183445.GA7154@willie-the-truck>
 <806fe068-893c-4167-8162-699328014e2b@app.fastmail.com>
 <79a5261a-c215-4db6-a81a-558223f48ab8@sirena.org.uk>
Date: Tue, 21 May 2024 23:23:10 +0200
From: "Janne Grunau" <j@jannau.net>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Will Deacon" <will@kernel.org>, "Johannes Nixdorf" <mixi@shadowice.org>,
 "Marc Zyngier" <maz@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [BUG] dm-crypt broken after 2632e2521769 ("arm64: fpsimd: Implement lazy
 restore for kernel mode FPSIMD")
Content-Type: text/plain



On Tue, May 21, 2024, at 22:21, Mark Brown wrote:
> On Tue, May 21, 2024 at 10:06:36PM +0200, Janne Grunau wrote:
>
>> Running SIMD intense workloads in user space apparently increase the
>> reproduction odds. When running AV1 decoding using dav1d in parallel
>> errors appear faster. Errors manifest either in changed decoder
>> output, fio verification errors or both. I'm using `dav1d -i
>> sample.ivf --muxer xxh3 -o -` here as user space SIMD payload but I'd
>> assume the exact SIMD user space code doesn't matter as long as it
>> runs on all CPU cores.
>
> There's fp-stress in tools/testing/selftests/arm64/fp which will run two
> copies of fpsimd-test (from the same directory) per core in parallel
> looking for corruption in the FPSIMD registers.  Specify '-t -1' and
> it'll run for ever.

It's hard (impossible) to reproduce just with fio and fp-stress. 5 consecutive fio runs (each 40-45 seconds) without verification error in fio or Mismatch from fpsimd-test.

With AV1 decoding in parallel each fio run shows at least one of decoding mismatch, fio verification error or mismatches from fpsimd-test as below:

| # FPSIMD-6-0: Mismatch: PID=2110, iteration=9989281, reg=0
| # FPSIMD-6-0:   Expected [3e0800103e0840103e0880103e08c010]
| # FPSIMD-6-0:   Got      [f0f3cf35dea2f3ea41a13a27d8d9369b]
| # Sending signals, timeout remaining: -1
| ...
| # Sending signals, timeout remaining: -1
| # FPSIMD-7-0: Mismatch: PID=2112, iteration=15635931, reg=6
| # FPSIMD-7-0:   Expected [400806b0400846b0400886b04008c6b0]
| # FPSIMD-7-0:   Got      [b24b366b6b3b470ce763389ad425a33d]
| # FPSIMD-4-0: Mismatch: PID=2106, iteration=13371905, reg=0
| # FPSIMD-4-0:   Expected [3a0800103a0840103a0880103a08c010]
| # FPSIMD-4-0:   Got      [b9a7d504554cc797724fab09aa988e2f]
| # Sending signals, timeout remaining: -1
| ...
| # Sending signals, timeout remaining: -1
| # FPSIMD-5-0: Mismatch: PID=2108, iteration=14880477, reg=0
| # FPSIMD-5-0:   Expected [3c0800d03c0840d03c0880d03c08c0d0]
| # FPSIMD-5-0:   Got      [c550b9a0f0947cd38aa17241e129f9a6]
| # FPSIMD-7-1: Mismatch: PID=2113, iteration=17682959, reg=0
| # FPSIMD-7-1:   Expected [410800f0410840f0410880f04108c0f0]
| # FPSIMD-7-1:   Got      [98a43b8ae2157b6b30497714c52bf6d6]
| # FPSIMD-2-0: Mismatch: PID=2102, iteration=16482263, reg=0
| # FPSIMD-2-0:   Expected [3608007036084070360880703608c070]
| # FPSIMD-2-0:   Got      [1cf724cdaf8f997338ee499a5f1f33e7]

In the majority of cases the mismatch is reported for reg=0.
Running just fp-stress and AV1 decoding without fio reports no errors.

The fio testing probably caused segfaults in sddm / kwin on the tests system using llvmpipe.

best regards

Janne
