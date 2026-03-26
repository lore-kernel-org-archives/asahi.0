Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D63FD152;
	Thu, 26 Mar 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535329; cv=none; b=RzZ3Q5TNLm8UbetbN0/LBXfpUEYQx7SHBduqST8SWz4grPLBvchoSLwlAVLJN2X/ngN9GDY5PAzlNYMC0sZaJalkQrtC6uYxFrDlOF3Dv4OSqhdmRO4xsvcqIdjWqWQgeZmO+KuiUwuPk6CFUNqzW04GysSbzbe0fscC6UMm2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535329; c=relaxed/simple;
	bh=9qmbprKUMbqPiWVN+/bZb7MOWCpDyMug8liR6R/yc+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkPR1YcVvLfDaqZ+fpMS8fcTaOi8bCipi+i4oPcEcEy9JKRf03K9WAWYuVgpEcd4SKBHLAm4VavaMuQsbVGvMzvJ3y1oMBFoHbXUdZovh43/6oHpVlaKiTnw3vuZW6KeKQeMUTnvqg63a/TH16D3rFpnHfKce0ML5IYubOuVc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCEyCUb4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCEyCUb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFCBC116C6;
	Thu, 26 Mar 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774535328;
	bh=9qmbprKUMbqPiWVN+/bZb7MOWCpDyMug8liR6R/yc+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCEyCUb4Sbe57pTItGWDihVwE3k84WC8IH+5WEC7oSc5qBrt9ukC6VkCwE5EyJHHp
	 Rc3K1H4UaO4J24Qa1z5epnSPdtb+OKCRgphqP4KPPbYWZxkHUfcWPr9/pj3Q/iHrDv
	 tfqYeUI5VuZv3xmcsWa8mXkGDrePxWlIdxMcvVwtXFe1Bz89xBqT2mgOE1W4d2ULgB
	 xn/rCjUrG0wjZroIrAesNjXwfyvfR7HdXRTnMMEPcOYdRtnfaLGUD/Cp+e1QhSPRtH
	 2YaaDiWIydJe90eiAi+QqorJqXCLNqFmg5FNbvfA8SRNROCdI2/A+/IE854RFxv5Va
	 dTxYw77Ec+9jQ==
Date: Thu, 26 Mar 2026 08:28:46 -0600
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Cc: "hch@lst.de" <hch@lst.de>, Justin Tee <justintee8345@gmail.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>,
	James Smart <james.smart@broadcom.com>,
	"kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7J207J2A7IiY?= <euns212.lee@samsung.com>,
	=?utf-8?B?7Lm47LCs?= <joshi.k@samsung.com>
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
Message-ID: <acVCnozG1WKPkq1L@kbusch-mbp>
References: <20260326061443.GA23850@lst.de>
 <acQxjZMOqj74yIJf@kbusch-mbp>
 <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
 <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
 <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
 <20260326014429epcms2p135ffd3c2b2fface6423d045e9614c262@epcms2p1>
 <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p5>
 <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326065152epcms2p51a18d3bbecb6eb6dc2ddba09651e5152@epcms2p5>

On Thu, Mar 26, 2026 at 03:51:52PM +0900, 전민식 wrote:
>  {
>  	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
>  
> -	trace_nvme_complete_rq(req);
> +	/*
> +	 * The idea for these trace events was to match up commands
> +	 * dispatched to hardware with the hardware's posted response.
> +	 * So skip tracing for undispatched commands.
> +	 */
> +	if (nvme_req(req)->status != NVME_SC_HOST_PATH_ERROR)
> +		trace_nvme_complete_rq(req);
> +

Well, how do we know a controller doesnn't actually return that status
code? I was just suggesting to skip the trace for the condition we never
dispatched the command. An added bonus is we don't need a mostly
unnecessary 'if' check on every IO.

---
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f5ebcaa2f859c..0dcccdca2965e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -454,11 +454,10 @@ void nvme_end_req(struct request *req)
 	blk_mq_end_request(req, status);
 }
 
-void nvme_complete_rq(struct request *req)
+static void __nvme_complete_rq(struct request *req)
 {
 	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
 
-	trace_nvme_complete_rq(req);
 	nvme_cleanup_cmd(req);
 
 	/*
@@ -493,6 +492,12 @@ void nvme_complete_rq(struct request *req)
 		return;
 	}
 }
+
+void nvme_complete_rq(struct request *req)
+{
+	trace_nvme_complete_rq(req);
+	__nvme_complete_rq(req);
+}
 EXPORT_SYMBOL_GPL(nvme_complete_rq);
 
 void nvme_complete_batch_req(struct request *req)
@@ -513,7 +518,7 @@ blk_status_t nvme_host_path_error(struct request *req)
 {
 	nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
 	blk_mq_set_request_complete(req);
-	nvme_complete_rq(req);
+	__nvme_complete_rq(req);
 	return BLK_STS_OK;
 }
 EXPORT_SYMBOL_GPL(nvme_host_path_error);
--
