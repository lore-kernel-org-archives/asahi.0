Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399622882BE;
	Sun, 22 Mar 2026 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774181426; cv=none; b=gAR+E+PdAh1IrTV6oj+JjvvVwt0XRgnhBZBGjPDuMFxV7n/HIHvN5Njif3QbVUnY4YhOkFnv07Pw9BEA5NtV6Rq3MQNkesjuuZ01Xymq4QvUy8k6Isoza42oUc3geozgh2QA/p/3ed9BQ+tix/lMg0/VWPISNMXSGZj/7GQRWtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774181426; c=relaxed/simple;
	bh=FiSORyFIdIZ2F5fDS7mDHv41diJnTp+IxLV9U2/jyKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmcZv93YWIaOhxKzZ3i6CpMxmGRR5F5m2krjRSATe+CCGbJ6uIfIAuJH9QOCWupi+Mc4hEvopm33qNhK5EUpJtcfujB+8la7MKSqLS5MMXcWmNavaF7tF7kYUerIyV5Lj7iAJBEwASjgTRFrS6kRfUFSpQBbAlsuDrinKmA7Zk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j220CnFS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j220CnFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774181424; x=1805717424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FiSORyFIdIZ2F5fDS7mDHv41diJnTp+IxLV9U2/jyKE=;
  b=j220CnFSEa3I6khQXCGN0RfVxATvwqYa1zE0PzBWQ0UMyUX7hj6TMAkW
   VjFu+QsOuZ6Ggv3Tr4DMs+10hx3zREuDL59OmwmVTzEcP/VyfS9Q1BNFl
   uK6vN6lqFK0FBjHhFVEoODFNP+PMoNz6pVUXEhi1lH0Zz1GKpkzYdN3VX
   Gf7288XuN7QZvGLcSJd43aDrlFUVBs68UnRNom5SEafiW7iArGNnsp5x2
   U7LtNIybPKFLKyVuGMnv6n/+a/S1vR5sWQi3lfSYUlGChg3v7HOyVhXe9
   dbhe9bb18J06uHm2r/9IuaEypcpyacCP+/0etxblj+j1spFeMSVuNFoqQ
   g==;
X-CSE-ConnectionGUID: CX5NfjI/R/u8n3YnLcd+HQ==
X-CSE-MsgGUID: CCE53d51TUK3Oj465Xio6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75085844"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75085844"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 05:10:24 -0700
X-CSE-ConnectionGUID: Haa6IgncQm6bgkG0/AV0AQ==
X-CSE-MsgGUID: OBrAZaQHQzWGFzgXUem91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="222970651"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Mar 2026 05:10:20 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4HdI-0000000026P-1Bti;
	Sun, 22 Mar 2026 12:10:16 +0000
Date: Sun, 22 Mar 2026 20:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, "sven@kernel.org" <sven@kernel.org>,
	"j@jannau.net" <j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>,
	"hch@lst.de" <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>,
	"kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
Message-ID: <202603222033.ACImXpPE-lkp@intel.com>
References: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>

Hi 전민식,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/nvme-Move-nvme_setup_cmd-before-hot_pathing/20260322-080947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6%40epcms2p4
patch subject: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260322/202603222033.ACImXpPE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222033.ACImXpPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603222033.ACImXpPE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/rdma.c: In function 'nvme_rdma_queue_rq':
>> drivers/nvme/host/rdma.c:2067:1: warning: label 'unmap_qe' defined but not used [-Wunused-label]
    2067 | unmap_qe:
         | ^~~~~~~~


vim +/unmap_qe +2067 drivers/nvme/host/rdma.c

71102307196028 Christoph Hellwig 2016-07-06  1991  
fc17b6534eb839 Christoph Hellwig 2017-06-03  1992  static blk_status_t nvme_rdma_queue_rq(struct blk_mq_hw_ctx *hctx,
71102307196028 Christoph Hellwig 2016-07-06  1993  		const struct blk_mq_queue_data *bd)
71102307196028 Christoph Hellwig 2016-07-06  1994  {
71102307196028 Christoph Hellwig 2016-07-06  1995  	struct nvme_ns *ns = hctx->queue->queuedata;
71102307196028 Christoph Hellwig 2016-07-06  1996  	struct nvme_rdma_queue *queue = hctx->driver_data;
71102307196028 Christoph Hellwig 2016-07-06  1997  	struct request *rq = bd->rq;
71102307196028 Christoph Hellwig 2016-07-06  1998  	struct nvme_rdma_request *req = blk_mq_rq_to_pdu(rq);
71102307196028 Christoph Hellwig 2016-07-06  1999  	struct nvme_rdma_qe *sqe = &req->sqe;
f4b9e6c90c5725 Keith Busch       2021-03-17  2000  	struct nvme_command *c = nvme_req(rq)->cmd;
71102307196028 Christoph Hellwig 2016-07-06  2001  	struct ib_device *dev;
3bc32bb1186cca Christoph Hellwig 2018-06-11  2002  	bool queue_ready = test_bit(NVME_RDMA_Q_LIVE, &queue->flags);
fc17b6534eb839 Christoph Hellwig 2017-06-03  2003  	blk_status_t ret;
fc17b6534eb839 Christoph Hellwig 2017-06-03  2004  	int err;
71102307196028 Christoph Hellwig 2016-07-06  2005  
71102307196028 Christoph Hellwig 2016-07-06  2006  	WARN_ON_ONCE(rq->tag < 0);
71102307196028 Christoph Hellwig 2016-07-06  2007  
ae1c609d185960 전민식            2026-03-20  2008  	ret = nvme_setup_cmd(ns, rq);
ae1c609d185960 전민식            2026-03-20  2009  	if (ret)
ae1c609d185960 전민식            2026-03-20  2010  		return ret;
ae1c609d185960 전민식            2026-03-20  2011  
a97157440e1e69 Andy Chiu         2021-04-26  2012  	if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
a97157440e1e69 Andy Chiu         2021-04-26  2013  		return nvme_fail_nonready_command(&queue->ctrl->ctrl, rq);
553cd9ef82edd8 Christoph Hellwig 2016-11-02  2014  
71102307196028 Christoph Hellwig 2016-07-06  2015  	dev = queue->device->dev;
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2016  
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2017  	req->sqe.dma = ib_dma_map_single(dev, req->sqe.data,
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2018  					 sizeof(struct nvme_command),
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2019  					 DMA_TO_DEVICE);
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2020  	err = ib_dma_mapping_error(dev, req->sqe.dma);
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2021  	if (unlikely(err))
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2022  		return BLK_STS_RESOURCE;
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2023  
71102307196028 Christoph Hellwig 2016-07-06  2024  	ib_dma_sync_single_for_cpu(dev, sqe->dma,
71102307196028 Christoph Hellwig 2016-07-06  2025  			sizeof(struct nvme_command), DMA_TO_DEVICE);
71102307196028 Christoph Hellwig 2016-07-06  2026  
6887fc6495f2df Sagi Grimberg     2022-10-03  2027  	nvme_start_request(rq);
71102307196028 Christoph Hellwig 2016-07-06  2028  
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2029  	if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2030  	    queue->pi_support &&
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2031  	    (c->common.opcode == nvme_cmd_write ||
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2032  	     c->common.opcode == nvme_cmd_read) &&
0372dd4e361717 Daniel Wagner     2023-12-18  2033  	    nvme_ns_has_pi(ns->head))
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2034  		req->use_sig_mr = true;
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2035  	else
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2036  		req->use_sig_mr = false;
5ec5d3bddc6b91 Max Gurtovoy      2020-05-19  2037  
fc17b6534eb839 Christoph Hellwig 2017-06-03  2038  	err = nvme_rdma_map_data(queue, rq, c);
a7b7c7a105a528 Max Gurtovoy      2017-08-14  2039  	if (unlikely(err < 0)) {
71102307196028 Christoph Hellwig 2016-07-06  2040  		dev_err(queue->ctrl->ctrl.device,
fc17b6534eb839 Christoph Hellwig 2017-06-03  2041  			     "Failed to map data (%d)\n", err);
71102307196028 Christoph Hellwig 2016-07-06  2042  		goto err;
71102307196028 Christoph Hellwig 2016-07-06  2043  	}
71102307196028 Christoph Hellwig 2016-07-06  2044  
b4b591c87f2b0f Sagi Grimberg     2017-11-23  2045  	sqe->cqe.done = nvme_rdma_send_done;
b4b591c87f2b0f Sagi Grimberg     2017-11-23  2046  
71102307196028 Christoph Hellwig 2016-07-06  2047  	ib_dma_sync_single_for_device(dev, sqe->dma,
71102307196028 Christoph Hellwig 2016-07-06  2048  			sizeof(struct nvme_command), DMA_TO_DEVICE);
71102307196028 Christoph Hellwig 2016-07-06  2049  
fc17b6534eb839 Christoph Hellwig 2017-06-03  2050  	err = nvme_rdma_post_send(queue, sqe, req->sge, req->num_sge,
f41725bbe16b07 Israel Rukshin    2017-11-26  2051  			req->mr ? &req->reg_wr.wr : NULL);
16686f3a6c3cd6 Max Gurtovoy      2019-10-13  2052  	if (unlikely(err))
16686f3a6c3cd6 Max Gurtovoy      2019-10-13  2053  		goto err_unmap;
71102307196028 Christoph Hellwig 2016-07-06  2054  
fc17b6534eb839 Christoph Hellwig 2017-06-03  2055  	return BLK_STS_OK;
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2056  
16686f3a6c3cd6 Max Gurtovoy      2019-10-13  2057  err_unmap:
16686f3a6c3cd6 Max Gurtovoy      2019-10-13  2058  	nvme_rdma_unmap_data(queue, rq);
71102307196028 Christoph Hellwig 2016-07-06  2059  err:
62eca39722fd99 Chao Leng         2021-02-01  2060  	if (err == -EIO)
62eca39722fd99 Chao Leng         2021-02-01  2061  		ret = nvme_host_path_error(rq);
62eca39722fd99 Chao Leng         2021-02-01  2062  	else if (err == -ENOMEM || err == -EAGAIN)
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2063  		ret = BLK_STS_RESOURCE;
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2064  	else
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2065  		ret = BLK_STS_IOERR;
16686f3a6c3cd6 Max Gurtovoy      2019-10-13  2066  	nvme_cleanup_cmd(rq);
62f99b62e5e3b8 Max Gurtovoy      2019-06-06 @2067  unmap_qe:
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2068  	ib_dma_unmap_single(dev, req->sqe.dma, sizeof(struct nvme_command),
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2069  			    DMA_TO_DEVICE);
62f99b62e5e3b8 Max Gurtovoy      2019-06-06  2070  	return ret;
71102307196028 Christoph Hellwig 2016-07-06  2071  }
71102307196028 Christoph Hellwig 2016-07-06  2072  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
